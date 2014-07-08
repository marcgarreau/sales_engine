require 'csv'
require 'date'
require_relative './invoice.rb'
require_relative 'finder'
require_relative 'parser'

class InvoiceRepository
  include Finder
  attr_reader  :invoices,
               :results,
               :engine
  alias_method :items,
               :invoices

  def initialize(engine, filename="./data/invoices.csv")
     @invoices = Parser.new.parse(filename, Invoice, self)
     @engine   = engine
     @results  = []
  end

  def inspect
    "#<#{self.class} #{invoices.size} rows>"
  end

  define_finders :id,
                 :customer_id,
                 :merchant_id,
                 :status,
                 :created_at,
                 :updated_at
end
