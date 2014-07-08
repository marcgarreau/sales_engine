require 'date'
# require 'pry'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id         = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = Date.parse(row[:updated_at]).to_s
    @updated_at = Date.parse(row[:created_at]).to_s
    @repository = repository
  end

  def invoices
    @repository.engine.invoice_repository.find_all_by_customer_id(id)
  end

  def transactions
    invoices.flat_map(&:transactions)
  end

  def successful_transactions
    invoices.flat_map(&:successful_transactions)
  end

  def favorite_merchant
    ids = successful_transactions.group_by(&:invoice_id)
    top_id = ids.max_by {|_,v| v.count}.first
    invoice = @repository.engine.invoice_repository.find_by_id(top_id)
    invoice.merchant
  end
end
