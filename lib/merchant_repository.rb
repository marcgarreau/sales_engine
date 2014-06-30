require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(file="./data/fixtures/fake_merchants.csv")
    @merchants = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_merchants
    @csv.each do |row|
      @merchants << Merchant.new(row)
    end
  end
end
