require 'csv'
require 'bigdecimal'
require 'bigdecimal/util'
require 'date'
require_relative 'invoice_item'
require_relative 'finder'
require_relative 'parser'

class InvoiceItemRepository
  include Finder
  attr_reader  :invoice_items,
               :engine
  alias_method :items,
               :invoice_items

  def initialize(engine, filename="./data/invoice_items.csv")
     @invoice_items = Parser.new.parse(filename, InvoiceItem, self)
     @engine        = engine
     @results       = []
  end

  def inspect
    "#<#{self.class} #{invoice_items.size} rows>"
  end

  def create_invoice_item(item_info, invoice_id)
    id = all.count + 1
    item = item_info[0]
    quantity = item_info[1]
    invoice_item = InvoiceItem.new({id: id,
                                    item_id: item.id,
                                    invoice_id: invoice_id,
                                    quantity: quantity,
                                    unit_price: item.unit_price.to_d / 100,
                                    created_at: Time.now.utc.to_s,
                                    updated_at: Time.now.utc.to_s },
                                    self
                    )
    all << invoice_item
    invoice_item
  end

  define_finders :id,
                 :item_id,
                 :invoice_id,
                 :quantity,
                 :unit_price
end
