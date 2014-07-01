require 'csv'
require_relative './item.rb'

class ItemRepository

  attr_reader :items

  def initialize(file="./data/fixtures/fake_items.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @items = @csv.map {|row| Item.new(row)}
  end
end
