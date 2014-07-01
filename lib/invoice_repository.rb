require 'csv'
require_relative './invoice.rb'

class InvoiceRepository

  attr_reader :invoices, :results

  def initialize(file="./data/fixtures/fake_invoices.csv")
    @csv = CSV.open(file, headers: true, header_converters: :symbol)
    @invoices = @csv.map {|row| Invoice.new(row)}
  end

  def all
    @invoices
  end

  def random
    @invoices.shuffle.first
  end

  def find_by_status(status)
    results = @invoices.find {|invoice| invoice.status == status}
  end

  def find_all_by_status(status)
    results = @invoices.find_all {|invoice| invoice.status == status}
  end

  def find_all_by_customer_id(id)
    results = @invoices.find_all {|invoice| invoice.customer_id == id}
  end

  def find_by_invoice_id(invoice_id)
    results = @invoices.find {|invoice| invoice.id == invoice_id.to_s}
  end
end
