require_relative './test_helper.rb'

class InvoiceItemRepositoryTest < Minitest::Test

  def test_it_can_add_merchants
    repo = InvoiceItemRepository.new
    assert repo.invoice_items.count >= 10
  end
end
