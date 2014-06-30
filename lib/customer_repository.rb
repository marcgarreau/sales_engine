require 'csv'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def initialize(file="./data/fixtures/fake_customers.csv")
    @customers = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_customers
    @customers = @csv.map {|row| Customer.new(row)}
    return @customers
  end
end
