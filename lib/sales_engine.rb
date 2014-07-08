require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_reader :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def initialize(arg)
    startup
  end

  def startup
    @customer_repository      ||= CustomerRepository.new(self)
    @invoice_item_repository  ||= InvoiceItemRepository.new(self)
    @invoice_repository       ||= InvoiceRepository.new(self)
    @item_repository          ||= ItemRepository.new(self)
    @merchant_repository      ||= MerchantRepository.new(self)
    @transaction_repository   ||= TransactionRepository.new(self)
  end
end

#For testing the SalesEngine class:
if __FILE__ == $0
  @engine = SalesEngine.new
  @engine.startup
  merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
  invoice      = @engine.invoice_repository.find_by_merchant_id(id)
  invoice_item = @engine.invoice_item_repository.find_by_id(invoice.id)
  items        = @engine.item_repository.find_all_by_id(invoice_item.item_id)


end
