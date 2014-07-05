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

  def initialize(engine, file="./data/fixtures/fake_merchants.csv")
    @results = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @merchants = @csv.map {|row| Merchant.new(row, self)}
  end

  def revenue(data)
    
  end

  define_finders :id,
                 :name
end
