require 'csv'
require_relative 'customer'

class CustomerRepository

  attr_reader :customers, :results

  def initialize(file="./data/fixtures/fake_customers.csv")
    @results = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @customers = @csv.map {|row| Customer.new(row)}
  end

  def all
    @customers
  end

  def random
    @customers.shuffle.first
  end

  def find_by_last_name(name)
    results = @customers.find {|customer| customer.last_name == name}
  end

  def find_all_by_first_name(name)
    results = @customers.find_all {|customer| customer.first_name == name}
  end

  def find_by_id(customer_id)
    results = @customers.find {|customer| customer.id == customer_id}
  end
end
