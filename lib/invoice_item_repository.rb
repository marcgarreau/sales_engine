require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(file="./data/fixtures/fake_invoice_items.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoice_items = @csv.map {|row| InvoiceItem.new(row)}
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.shuffle.first
  end

  def find_by_item_id(id)
    result = @invoice_items.find {|invoice_item| invoice_item.item_id == id}
  end

  def find_all_by_quantity(quant)
    results = @invoice_items.find_all {|invoice_item| invoice_item.quantity == quant}
  end

  # def find_by_name(name)
  #   results = @invoice_items.find {|invoice_item| invoice_item.item_id == name}
  # end

  def find_all_by_item_id(id)
    results = @invoice_items.find_all {|invoice_item| invoice_item.item_id == id}
  end
end
