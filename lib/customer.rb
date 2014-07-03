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
    results = @repository.engine.invoice_repository.find_all_by_customer_id(id)
  end
end
