class SalesEngine

  def startup

  end

  def merchant_repository #after called, now you can use it
    @merchant_repository = MerchantRepository.new
    #Returns array of merchants
  end


end



# if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup

  @merchant_repository.all
# end
