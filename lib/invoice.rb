require 'date'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status      = row[:status]
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def items
    invoice_items.map(&:item)
  end

  def customer
    repository.engine.customer_repository.find_by_id(customer_id)
  end

  def customers
    repository.engine.customer_repository.find_all_by_id(customer_id)
  end

  def transactions
    repository.engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

  def amount
    invoice_items.map(&:total_price).reduce(0, :+)
  end

  def has_successful_charge?
    transactions.any?(&:successful?)
  end

  def successful_transactions
    transactions.find_all(&:successful?)
  end

  protected

  attr_reader :repository
end
