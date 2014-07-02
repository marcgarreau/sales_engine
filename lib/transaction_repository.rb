require 'csv'
require_relative 'transaction'
require_relative 'finder'

class TransactionRepository
  include TransactionFinder
  attr_reader :transactions,
              :results,
              :engine

  def initialize(engine, file="./data/fixtures/fake_transactions.csv")
    @collection = []
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @transactions = @csv.map {|row| Transaction.new(row, self)}
  end
end
