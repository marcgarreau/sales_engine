require 'csv'
require_relative 'customer'
require './lib/finder.rb'

class CustomerRepository
  include CustomerFinder
  attr_reader :customers,
              :results,
              :engine

  def initialize(engine, file="./data/fixtures/fake_customers.csv")
    @results = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @customers = @csv.map {|row| Customer.new(row, self)}
  end
end
