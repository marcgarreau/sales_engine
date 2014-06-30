require 'minitest/autorun'
require 'minitest/pride'

require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_it_initializes_with_an_empty_merchants_array
    repo = MerchantRepository.new
    assert_equal 0, repo.merchants.count
  end

  def test_it_can_add_merchants
    repo = MerchantRepository.new
    repo.build_merchants
    assert repo.merchants.count >= 10
  end
end
