require 'date'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id]
    @name        = row[:name]
    @created_at  = Date.parse(row[:updated_at]).to_s
    @updated_at  = Date.parse(row[:created_at]).to_s
    @repository  = repository
  end

  def items
    @repository.engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    @repository.engine.invoice_repository.find_all_by_merchant_id(id)
  end

end
