require 'csv'
require_relative './invoice.rb'

class InvoiceRepository

  attr_reader :invoices, :results

  def initialize(file="./data/fixtures/fake_invoices.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoices = @csv.map {|row| Invoice.new(row)}
  end

  def find_by_status(status)
    @results = @invoices.find {|invoice| invoice.status == status}
  end

  def find_all_by_status(status)
    @results = @invoices.find_all {|invoice| invoice.status == status}
  end
end
