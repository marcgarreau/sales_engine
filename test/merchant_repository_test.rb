require_relative './test_helper.rb'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @repo = MerchantRepository.new("./data/fixtures/fake_merchants.csv")
  end

  def test_it_initializes_with_merchants
    assert @repo.merchants.count >= 10
  end

  def test_it_can_find_by_name
    result = @repo.find_by_name("Willms and Sons")
    assert_equal "Willms and Sons", result.name
    #find method always returns one value
  end

  def test_it_can_find_all_by_name
    results = @repo.find_all_by_name("Williamson Group")
    assert_equal 2, results.count
    #find_by method returns an array
  end

  def test_it_can_find_revenue_for_a_merchant
    skip
    date = Date.parse "Tue, 20 Mar 2012"
    revenue = @repo.revenue(date)
    assert_equal BigDecimal.new("2549722.91"), revenue
  end
end
