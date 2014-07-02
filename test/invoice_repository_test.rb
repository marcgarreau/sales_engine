require_relative './test_helper.rb'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @repo = InvoiceRepository.new("./data/fixtures/fake_invoices.csv")
  end

  def test_it_can_add_invoices_to_the_repository
    assert @repo.invoices.count >= 10
  end

  def test_it_can_find_by_status
    result = @repo.find_by_status("shipped")
    assert_equal "76", result.merchant_id
  end

  def test_it_can_find_all_by_status
    results = @repo.find_all_by_status("shipped")
    assert results.count >= 10
  end
end
