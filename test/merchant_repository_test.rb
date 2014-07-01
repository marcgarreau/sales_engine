require_relative './test_helper.rb'

class MerchantRepositoryTest < Minitest::Test
  
  def test_it_can_add_merchants
    repo = MerchantRepository.new
    assert repo.merchants.count >= 10
  end
end
