require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(file="./data/fixtures/fake_invoice_items.csv")
    @invoice_items = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_invoice_items
    @invoice_items = @csv.map {|row| InvoiceItem.new(row)}
    return @invoice_items
  end
end
