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
    #returns single Merchant instance with most Customer transactions
    #find successful transactions associated with cust, then group them by invoice, then by merchant
    customer_invoice = @repository.engine.invoice_repository.find_all_by_customer_id(id)
    customer_invoice_id = customer_invoice.id
    y = Hash[ transactions.map {|transaction| [transaction.invoice_id, @repository.engine.invoice_repository.find_all_by_id(transaction.invoice_id).count] } ]

    #check this logic ^^
    x = y.max_by { |k,v| v }.first
    # binding.pry
    #find the invoice object with id found above
    invoice = @repository.engine.invoice_repository.find_by_id(x)
    z = @repository.engine.merchant_repository.find_by_id(invoice.merchant_id)
  end
end
