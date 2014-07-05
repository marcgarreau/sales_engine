require 'csv'
require 'bigdecimal'
require 'date'
require_relative './item.rb'
require_relative 'finder'

class ItemRepository
  include Finder
  attr_reader :items, :results, :engine

  def initialize(engine, file="./data/fixtures/fake_items.csv")
    @results = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @items = @csv.map {|row| Item.new(row, self)}
  end

  def find_by_unit_price(arg)
    items.find {|x| x.unit_price == arg}
  end

  define_finders :id,
                 :name,
                 :description,
                #  :unit_price,
                 :merchant_id
end
