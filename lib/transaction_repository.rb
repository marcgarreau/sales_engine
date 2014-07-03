require 'csv'
require 'Date'
require_relative 'transaction'
require_relative 'finder'

class TransactionRepository
  include Finder
  attr_reader  :transactions,
               :results,
               :engine
  alias_method :items,
               :transactions

  def initialize(engine, file="./data/fixtures/fake_transactions.csv")
    @collection = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @transactions = @csv.map {|row| Transaction.new(row, self)}
  end

  define_finders :id,
                 :invoice_id,
                 :credit_card_number,
                 :credit_card_expiration_date,
                 :result
end
