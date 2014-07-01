require_relative './test_helper.rb'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_can_add_invoices_to_the_repository
    repo = InvoiceRepository.new
    assert repo.invoices.count >= 10
  end
end
