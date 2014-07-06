require 'csv'
require 'date'
require_relative 'customer'
require_relative 'finder'
require_relative 'parser'

class CustomerRepository
  include Finder
  attr_reader  :customers,
               :results,
               :engine
  alias_method :items,
               :customers

  def initialize(engine, filename="./data/fixtures/fake_customers.csv")
     @customers = Parser.new.parse(filename, Customer, self)
     @engine = engine
     @results = []
  end

  define_finders :id,
                 :first_name,
                 :last_name
end
