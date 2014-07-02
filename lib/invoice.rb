class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id]
    @customer_id = row[:customer_id]
    @merchant_id = row[:merchant_id]
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

# def invoice_items
#   results = repository.engine.invoice_item_repository.find_all_by_item_id(self.id)
# end

  def customer
    results = @repository.engine.customer_repository.find_by_id(customer_id)
  end
end
