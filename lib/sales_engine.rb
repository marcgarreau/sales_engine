require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'

class SalesEngine

  def startup
    #add repos
    merchant_repository
  end

  def merchant_repository #after called, now you can use it
    @merchant_repository = MerchantRepository.new
    #Returns array of merchants
  end
end

#For testing the SalesEngine class:
if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup

  @merchant_repository.all
end
