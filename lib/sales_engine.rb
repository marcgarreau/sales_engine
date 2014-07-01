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

  def invoices
    puts "hello"
  end
end

#For testing the SalesEngine class:
if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup

  #CustomerRepo Relationships:
  customer = engine.customer_repository.find_by_id 999
  puts customer.inspect
  puts customer.invoices.count # => 7
  #
  # customer.invoices.each do |invoice|
  #   invoice.customer_id.should == 999
  # end
end
