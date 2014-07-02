require 'csv'
require_relative './invoice.rb'
require_relative 'finder'

class InvoiceRepository
  include InvoiceFinder
  attr_reader :invoices, :results

  def initialize(file="./data/fixtures/fake_invoices.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoices = @csv.map {|row| Invoice.new(row)}  # (row, self) --> refactor finders
  end
end
