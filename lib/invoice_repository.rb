require 'csv'
require 'date'
require_relative './invoice.rb'
require_relative 'finder'

class InvoiceRepository
  include Finder
  attr_reader  :invoices,
               :results,
               :engine
  alias_method :items,
               :invoices

  def initialize(engine, file="./data/fixtures/fake_invoices.csv")
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoices = @csv.map {|row| Invoice.new(row, self)}
  end

  define_finders :id,
                 :customer_id,
                 :merchant_id,
                 :status,
                 :created_at,
                 :updated_at
end
