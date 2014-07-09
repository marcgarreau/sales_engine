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

  def create(hash)
    id = all.count + 1
    invoice = Invoice.new({:id         => id,
                          :customer_id => hash[:customer].id,
                          :merchant_id => hash[:merchant].id,
                          :status      => "shipped",
                          :created_at  => Time.now.utc.to_s,
                          :updated_at  => Time.now.utc.to_s },
                          self
                          )

    items = hash[:items].group_by { |item| item }.map { |k, v| [k, v.count] }
    items.each do |item_info|
      @engine.invoice_item_repository.create_invoice_item(item_info, id)
    end

    all << invoice
    invoice
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
