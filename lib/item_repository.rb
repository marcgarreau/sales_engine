require 'csv'
require 'bigdecimal'
require 'date'
require_relative './item.rb'
require_relative 'finder'
require_relative 'parser'

class ItemRepository
  include Finder
  attr_reader :items, :results, :engine

  def initialize(engine, filename="./data/fixtures/fake_items.csv")
     @items    = Parser.new.parse(filename, Item, self)
     @engine   = engine
     @results  = []
  end

  def find_by_unit_price(arg)
    items.find {|x| x.unit_price == arg}
  end

  define_finders :id,
                 :name,
                 :description,
                #:unit_price,
                 :merchant_id
end
