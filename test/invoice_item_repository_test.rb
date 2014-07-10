require_relative './test_helper.rb'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    @repo = InvoiceItemRepository.new("./data/fixtures/fake_invoice_items.csv")
  end

  def test_it_can_add_merchants
    assert @repo.invoice_items.count >= 10
  end

  def test_it_can_find_a_unit_price_by_item_id
    result = @repo.find_by_item_id(4)
    assert_equal BigDecimal.new("42.91"), result.unit_price
  end

  def test_it_can_find_all_by_invoice_id
    results = @repo.find_all_by_invoice_id(1)
    assert_equal 8, results.count
  end

  def test_it_can_find_all_by_quantity
    results = @repo.find_all_by_quantity(5)
    assert_equal 2164, results.count
  end

  def test_it_can_find_by_unit_price
    results = @repo.find_by_unit_price(BigDecimal.new("310.99"))
    assert_equal 1845, results.item_id
  end

  #def test_your_business_intelligence
end
