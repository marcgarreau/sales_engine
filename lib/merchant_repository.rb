require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants, :results

  def initialize(file="./data/fixtures/fake_merchants.csv")
    @results = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @merchants = @csv.map {|row| Merchant.new(row)}
  end

  def all
    @merchants
  end

  def random
    @merchants.shuffle.first
  end

  def find_by_name(name)
    results = @merchants.find {|merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    results = @merchants.find_all {|merchant| merchant.name == name}
  end
end
