require 'csv'
require 'Date'
require_relative 'transaction'
require_relative 'finder'
require_relative 'parser'

class TransactionRepository
  include Finder
  attr_reader  :transactions,
               :results,
               :engine
  alias_method :items,
               :transactions

  def initialize(engine, filename="./data/fixtures/fake_transactions.csv")
     @transactions = Parser.new.parse(filename, Transaction, self)
     @engine       = engine
     @results      = []
  end

  define_finders :id,
                 :invoice_id,
                 :credit_card_number,
                 :credit_card_expiration_date,
                 :result
end
