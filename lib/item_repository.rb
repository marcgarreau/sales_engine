require 'csv'
require 'bigdecimal'
require 'date'
require_relative './item.rb'
require_relative 'finder'
require_relative 'parser'

class ItemRepository
  include Finder
  attr_reader :items, :results, :engine

  def initialize(engine, filename="./data/items.csv")
     @items    = Parser.new.parse(filename, Item, self)
     @engine   = engine
     @results  = []
  end

  def find_by_unit_price(arg)
    items.find {|x| x.unit_price == arg}
  end

  def most_items(number)
    # build assoc array with [item_id, quantity]
    invoice_items = @engine.invoice_item_repository.all.flatten
    item_ids = invoice_items.map { |i_item| i_item.item_id }
    item_quantities = invoice_items.map { |i_item| i_item.quantity }
    pairs = item_ids.zip(item_quantities)
    # x = Array[ @engine.invoice_item_repository.all.flatten ]
    # binding.pry
  end

  define_finders :id,
                 :name,
                 :description,
                #:unit_price,
                 :merchant_id
end
