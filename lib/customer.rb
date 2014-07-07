require 'date'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id         = row[:id]
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
    #returns array of Transaction objects associated with the Customer
    #with the each invoice, find all transactions by invoice id
    invoices.map {|invoice| @repository.engine.transaction_repository.find_all_by_invoice_id(invoice.id) }.flatten
  end

  def favorite_merchant
    ids = transactions.map {|transaction| transaction.invoice_id }
    top_id = ids.group_by {|id| id}.max_by {|k,v| v.count}.first #returns invoice_id value # needs to return Invoice Instance
    invoice = @repository.engine.invoice_repository.find_by_id(top_id.to_s)
    z = @repository.engine.merchant_repository.find_by_id(invoice.merchant_id)
  end
end
