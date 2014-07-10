require_relative './test_helper.rb'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @repo = InvoiceRepository.new("./data/fixtures/fake_invoices.csv")
  end

  def test_it_can_add_invoices_to_the_repository
    assert @repo.invoices.count >= 10
  end

  def test_it_can_find_by_id
    result = @repo.find_by_id(3)
    assert_equal 78, result.merchant_id
  end

  def test_it_can_find_by_all_by_customer_id
    results = @repo.find_all_by_customer_id(1)
    assert_equal 8, results.count
  end

  def test_it_can_find_all_by_merchant_id
    results = @repo.find_all_by_merchant_id(75)
    assert_equal 48, results.count
  end

  def test_it_can_find_by_status
    result = @repo.find_by_status("shipped")
    assert_equal 26, result.merchant_id
  end

  def test_it_can_find_all_by_status
    results = @repo.find_all_by_status("shipped")
    assert results.count >= 10
  end

  #def test_your_business_intelligence
end
