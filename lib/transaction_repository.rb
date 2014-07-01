require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions, :results

  def initialize(file="./data/fixtures/fake_transactions.csv")
    @collection = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @transactions = @csv.map {|row| Transaction.new(row)}
  end

  def find_by_credit_card_number(credit_card_number)
    collection = @transactions.find {|transaction| transaction.credit_card_number == credit_card_number}
  end

  def find_all_by_result(result)
    collection = @transactions.find_all {|transaction| transaction.result == result}
  end
end
