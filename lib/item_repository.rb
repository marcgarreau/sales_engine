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

  def most_items(number)
    all.sort_by{ |item| item.quantity_sold }.reverse[0...number]
  end

  def most_revenue(number)
    all.sort_by { |item| item.revenue }.reverse[0...number]
  end

  def inspect
    "#<#{self.class} #{items.size} rows>"
  end

  define_finders :id,
                 :name,
                 :description,
                 :unit_price,
                 :merchant_id
end
