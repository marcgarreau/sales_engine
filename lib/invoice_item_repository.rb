require 'csv'
require_relative 'invoice_item'
require_relative 'finder'

class InvoiceItemRepository
  include InvoiceItemFinder
  attr_reader :invoice_items, :engine

  def initialize(engine, file="./data/fixtures/fake_invoice_items.csv")
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoice_items = @csv.map {|row| InvoiceItem.new(row, self)}
  end
end
