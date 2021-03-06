require 'date'
require 'pry'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :top_customer_id

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
    invoices = successful_invoices
    if date
      invoices = invoices.find_all { |i| i.updated_at == date }
    end
    invoices.map(&:amount).reduce(0, :+)
  end

  def quantity_sold
    invoices = successful_invoices
    invoices.map(&:quantity).reduce(0, :+)
  end

  def successful_invoices
    invoices.find_all(&:has_successful_charge?)
  end

  def customers_with_pending_invoices
    customer_invoices = invoices.find_all(&:pending?)
    customers = customer_invoices.flat_map(&:customer)
  end

  def favorite_customer
    @repository.engine.customer_repository.find_by_id(top_customer_id)
  end

  def customer_count
    successful_invoices.each_with_object(Hash.new(0)) do |invoice, counts|
      counts[invoice.customer_id] += 1
    end
  end

  def top_customer_id
    customer_count.max_by { |_, count| count }[0]
  end

  def customers
    invoices.flat_map(&:customers)
  end
end
