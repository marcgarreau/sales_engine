require 'csv'
require 'date'
require_relative 'merchant'
require_relative 'finder'

class MerchantRepository
  include Finder
  attr_reader  :merchants,
               :results,
               :engine
  alias_method :items,
               :merchants

  def initialize(engine, filename="./data/merchants.csv")
     @merchants = Parser.new.parse(filename, Merchant, self)
     @engine    = engine
     @results   = []
  end

  #what...?
  # def revenue(date)
  #   #find sum of (reduce(:+)) {each invoice item quantity * unit price}
  #   merchants.reduce(0) { |sum, merchant| sum + merchant.revenue(date) }
  # end

  define_finders :id,
                 :name
end
