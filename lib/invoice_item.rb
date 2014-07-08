require 'bigdecimal'
require 'bigdecimal/util'
require 'date'

class InvoiceItem
  include Finder
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :total_price,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id].to_i
    @item_id     = row[:item_id].to_i
    @invoice_id  = row[:invoice_id].to_i
    @quantity    = row[:quantity].to_i
    @unit_price  = pricify(row[:unit_price])
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def pricify(price)
    price.to_d / 100
  end

  def item
    @repository.engine.item_repository.find_by_id(item_id)
  end

  def invoice
    @repository.engine.invoice_repository.find_by_id(invoice_id)
  end

  def total_price
    unit_price * quantity
  end
end
