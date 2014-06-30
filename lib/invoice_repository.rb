require 'csv'
require_relative './invoice.rb'

class InvoiceRepository

  attr_reader :invoices

  def initialize(file="./data/fixtures/fake_invoices.csv")
    @invoices = []
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
  end

  def build_invoices
    @csv.each do |row|
      @invoices << Invoice.new(row)
    end
  end
end
