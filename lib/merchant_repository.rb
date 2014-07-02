require 'csv'
require_relative 'merchant'
require_relative 'finder'

class MerchantRepository
  include MerchantFinder
  attr_reader :merchants, :results

  def initialize(file="./data/fixtures/fake_merchants.csv")
    @results = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @merchants = @csv.map {|row| Merchant.new(row)}
  end
end
