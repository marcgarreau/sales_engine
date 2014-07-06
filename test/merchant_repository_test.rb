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
  end

  def test_it_can_find_all_by_name
    results = @repo.find_all_by_name("Williamson Group")
    assert_equal 2, results.count
  end

  def test_it_can_find_revenue_for_a_merchant
    skip
    date = Date.parse "Tue, 27 Mar 2012"
    revenue = @repo.revenue(date)
    assert revenue >= BigDecimal.new("200.00")
  end
end
