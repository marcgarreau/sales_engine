require_relative './test_helper.rb'

class InvoiceItemRepositoryTest < Minitest::Test

  def test_it_initializes_with_an_empty_invoice_item_array
    repo = InvoiceItemRepository.new
    assert_equal 0, repo.invoice_items.count
  end

  def test_it_can_add_merchants
    repo = InvoiceItemRepository.new
    repo.build_invoice_items
    assert repo.invoice_items.count >= 10
  end
end
