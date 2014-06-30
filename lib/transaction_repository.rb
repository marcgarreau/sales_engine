require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions

  def initialize(file="./data/fixtures/fake_transactions.csv")
    @transactions = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_transactions
    @transactions = @csv.map {|row| Transaction.new(row)}
    return @transactions
  end
end
