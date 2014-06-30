require 'csv'
require_relative 'customer'

class CustomerRepository

  attr_reader :customers, :results

  def initialize(file="./data/fixtures/fake_customers.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @customers = @csv.map {|row| Customer.new(row)}
  end

  def find_by_last_name(name)
    @results = @customers.select {|c| c.last_name == name}
  end
end
