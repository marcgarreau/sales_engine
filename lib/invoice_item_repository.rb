require 'csv'
require 'bigdecimal'
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

  define_finders :id,
                 :item_id,
                 :invoice_id,
                 :quantity,
                 :unit_price
end
