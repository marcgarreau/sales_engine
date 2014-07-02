require 'csv'
require_relative 'invoice_item'
require_relative 'finder'

class InvoiceItemRepository
  include InvoiceItemFinder
  attr_reader :invoice_items

  def initialize(file="./data/fixtures/fake_invoice_items.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoice_items = @csv.map {|row| InvoiceItem.new(row)}
  end
end
