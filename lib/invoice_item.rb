require 'bigdecimal'
require 'date'

class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id         = row[:id]
    @item_id    = row[:item_id]
    @invoice_id = row[:invoice_id]
    @quantity   = row[:quantity]
    @unit_price = BigDecimal.new(row[:unit_price])
    @created_at = Date.parse(row[:updated_at]).to_s
    @updated_at = Date.parse(row[:created_at]).to_s
    @repository = repository
  end

  def item
    @repository.engine.item_repository.find_by_id(item_id)
  end

  def invoice
    @repository.engine.invoice_repository.find_by_id(invoice_id)
  end
end
