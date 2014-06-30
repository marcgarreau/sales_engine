require 'csv'
require_relative './item.rb'

class ItemRepository

  attr_reader :items

  def initialize(file="./data/fixtures/fake_items.csv")
    @items = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_items
    @csv.each do |row|
      @items << Item.new(row)
    end
  end
end
