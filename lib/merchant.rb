require 'date'
require 'pry'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id]
    @name        = row[:name]
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def items
    @repository.engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    @repository.engine.invoice_repository.find_all_by_merchant_id(id)
  end

  #return to >>>
  # def revenue(date)
  #   all_invoices = invoices_by_date(date)
  #   all_invoices.reduce(0) { |sum, invoice| sum += invoice.total_price }
  # end
  #
  # def invoices_by_date(date)
  #   invoices.find_all do |invoice|
  #     Date.parse(invoice.updated_at) == date
  #   end
  # end

end
