require 'csv'
require_relative 'customer'
require './lib/finder.rb'

class CustomerRepository
  include Finder
  attr_reader  :customers,
               :results,
               :engine
  alias_method :items,
               :customers

  def initialize(engine, file="./data/fixtures/fake_customers.csv")
    @results = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @customers = @csv.map {|row| Customer.new(row, self)}
  end

  define_finders :id,
                 :first_name,
                 :last_name
end
