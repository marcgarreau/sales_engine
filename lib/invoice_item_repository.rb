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

  def find_by_item_id(id)
    @results = @invoice_items.find {|invoice_item| invoice_item.id == id}
  end

  def find_all_by_quantity(quant)
    @results = @invoice_items.find_all {|invoice_item| invoice_item.quantity == quant}
  end
end
