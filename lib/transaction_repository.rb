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

  def initialize(engine, filename="./data/transactions.csv")
     @transactions = Parser.new.parse(filename, Transaction, self)
     @engine       = engine
     @results      = []
  end

  def create_transaction(credit_card_data, invoice_id)
    id = all.count + 1
    transaction = Transaction.new({id: id,
                                   invoice_id: invoice_id,
                                   credit_card_number: credit_card_data[:credit_card_number],
                                   credit_card_expiration_date: credit_card_data[:credit_card_expiration_date],
                                   result: credit_card_data[:result],
                                   created_at: Time.now.utc.to_s,
                                   updated_at: Time.now.utc.to_s},
                                   self)
    all << transaction
    transaction
  end

  def inspect
    "#<#{self.class} #{transactions.size} rows>"
  end

  define_finders :id,
                 :invoice_id,
                 :credit_card_number,
                 :credit_card_expiration_date,
                 :result
end
