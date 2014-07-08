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

  def initialize(engine, filename="./data/customers.csv")
     @customers = Parser.new.parse(filename, Customer, self)
     @engine = engine
     @results = []
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  define_finders :id,
                 :first_name,
                 :last_name
end
