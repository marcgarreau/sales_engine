require_relative './test_helper.rb'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    @repo = InvoiceItemRepository.new("./data/fixtures/fake_invoice_items.csv")
  end

  def test_it_can_add_merchants
    assert @repo.invoice_items.count >= 10
  end

  def test_it_can_find_by_item_id
    result = @repo.find_by_item_id("2")
    assert_equal "13635", result.unit_price
  end

  def test_it_can_find_all_by_quantity
    results = @repo.find_all_by_quantity("6")
    assert results.count >= 2
  end
end
