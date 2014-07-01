require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(file="./data/fixtures/fake_merchants.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @merchants = @csv.map {|row| Merchant.new(row)}
  end
end
