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

  def initialize
    startup
  end

  def startup
    @customer_repository      = CustomerRepository.new
    @invoice_item_repository  = InvoiceItemRepository.new
    @invoice_repository       = InvoiceRepository.new
    @item_repository          = ItemRepository.new
    @merchant_repository      = MerchantRepository.new
    @transaction_repository   = TransactionRepository.new
  end
end

#For testing the SalesEngine class:
if __FILE__ == $0
  @engine = SalesEngine.new
  @engine.startup

  item = @engine.item_repository.find_by_name "Item Saepe Ipsum"
  # binding.pry
  a = InvoiceItemRepository.new.find_by_item_id(item.id) #449 item_id passed in
  b = InvoiceRepository.new.find_by_invoice_id(a.invoice_id) #4458 invoice item id passed in
  x = MerchantRepository.new.find_by_id(b.merchant_id)

  #CustomerRepo Relationships:
  # customer = engine.customer_repository.find_by_id 999
  # puts customer.inspect
  # puts customer.invoices.count # => 7
  #
  # customer.invoices.each do |invoice|
  #   invoice.customer_id.should == 999
  # end

  # transaction = engine.transaction_repository.find_by_id 1138
  # invoice_customer = engine.customer_repository.find_by_id 192
  # assert_equal transaction.invoice.customer.first_name, invoice_customer.first_name #Chloe
end
