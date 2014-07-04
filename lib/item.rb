require 'bigdecimal'
require 'date'

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
    @unit_price   = BigDecimal.new(row[:unit_price])/100
    @merchant_id  = row[:merchant_id]
    @created_at   = Date.parse(row[:created_at]).to_s
    @updated_at   = Date.parse(row[:updated_at]).to_s
    @repository   = repository
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end
end
