require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions

  def initialize(file="./data/fixtures/fake_transactions.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @transactions = @csv.map {|row| Transaction.new(row)}
  end
end
