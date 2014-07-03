require 'csv'
require 'bigdecimal'
require 'date'
require_relative 'invoice_item'
require_relative 'finder'

class InvoiceItemRepository
  include Finder
  attr_reader  :invoice_items,
               :engine
  alias_method :items,
               :invoice_items

  def initialize(engine, file="./data/fixtures/fake_invoice_items.csv")
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoice_items = @csv.map {|row| InvoiceItem.new(row, self)}
  end

  define_finders :id,
                 :item_id,
                 :invoice_id,
                 :quantity,
                 :unit_price
end
