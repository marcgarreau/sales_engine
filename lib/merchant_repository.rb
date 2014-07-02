require 'csv'
require_relative 'merchant'
require_relative 'finder'

class MerchantRepository
  include MerchantFinder
  attr_reader :merchants,
              :results,
              :engine

  def initialize(engine, file="./data/fixtures/fake_merchants.csv")
    @results = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @merchants = @csv.map {|row| Merchant.new(row, self)}
  end
end
