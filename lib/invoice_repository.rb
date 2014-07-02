require 'csv'
require_relative './invoice.rb'
require_relative 'finder'

class InvoiceRepository
  include InvoiceFinder
  attr_reader :invoices,
              :results,
              :engine

  def initialize(engine, file="./data/fixtures/fake_invoices.csv")
    @engine = engine
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoices = @csv.map {|row| Invoice.new(row, self)}
  end
end
