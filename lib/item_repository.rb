require 'csv'
require_relative './item.rb'
require_relative 'finder'

class ItemRepository
  include ItemFinder
  attr_reader :items, :results

  def initialize(file="./data/fixtures/fake_items.csv")
    @results = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @items = @csv.map {|row| Item.new(row)}
  end
end
