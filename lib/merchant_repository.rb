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

  def most_items(number)
    # top merchants by items sold
    all.sort_by {|merchant| merchant.quantity_sold }.reverse[0...number]
     
    # merchant_items = all.flat_map{ |merchant| merchant.items}
    # merchant_items.sort_by { |item| item.quantity_sold }.reverse[0...number]

    # binding.pry
    # return merchant objects
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

  define_finders :id,
                 :name
end
