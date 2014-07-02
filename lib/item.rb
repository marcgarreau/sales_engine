class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository=nil)
    @id           = row[:id]
    @name         = row[:name]
    @description  = row[:description]
    @unit_price   = row[:unit_price]
    @merchant_id  = row[:merchant_id]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @repository   = repository
  end

  def invoice_items
    results = repository.engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    invoice_item = repository.engine.invoice_item_repository.find_by_item_id(id)
    invoice = repository.engine.invoice_repository.find_by_id(invoice_item.invoice_id)
    merchant = repository.engine.merchant_repository.find_by_id(invoice.merchant_id)
  end
end
