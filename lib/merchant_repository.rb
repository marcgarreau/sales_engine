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

  def revenue(date)
    merchants.map { |merchant| merchant.revenue(date) }.reduce(0, :+)
  end

  define_finders :id,
                 :name
end
