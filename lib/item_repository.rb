require 'csv'
require_relative './item.rb'

class ItemRepository

  attr_reader :items, :results

  def initialize(file="./data/fixtures/fake_items.csv")
    @results = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @items = @csv.map {|row| Item.new(row)}
  end

  def all
    @items
  end

  def random
    @items.shuffle.first
  end

  def find_by_unit_price(unit_price)
    results = @items.find {|item| item.unit_price == unit_price}
  end

  def find_all_by_name(name)
    results = @items.find_all {|item| item.name == name}
  end

end
