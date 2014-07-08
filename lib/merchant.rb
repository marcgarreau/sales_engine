require 'date'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id].to_i
    @name        = row[:name]
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def items
    @repository.engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    @repository.engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def revenue(date = nil)
    invoices = invoices_with_successful_charge
    if date
      invoices = invoices.find_all { |i| i.updated_at == date }
    end
    invoices.map(&:amount).reduce(0, :+)
  end

  def invoices_with_successful_charge
    invoices.find_all(&:has_successful_charge?)
  end

  def favorite_customer
    cust_count = invoices_with_successful_charge.each_with_object(Hash.new(0)) do |invoice, counts|
      counts[invoice.customer_id] += 1
    end
    top_customer_id = cust_count.max_by { |customer_id, count| count }[0]
    @repository.engine.customer_repository.find_by_id(top_customer_id)
  end

  def customers
    invoices.flat_map(&:customers)
  end

  def successful_transactions
    invoices.flat_map(&:successful_transactions)
  end
end
