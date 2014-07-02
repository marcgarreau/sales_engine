class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id]
    @name        = row[:name]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def items
    invoice.items
  end

  def invoice
    @repository.engine.invoice_repository.find_by_merchant_id(id)
  end

end
