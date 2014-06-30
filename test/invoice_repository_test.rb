gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository.rb'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_repository
    repo = InvoiceRepository.new
    assert_equal 0, repo.invoices.count
  end

  def test_it_can_add_invoices_to_the_repository
    repo = InvoiceRepository.new
    repo.build_invoices
    assert repo.invoices.count >= 10
  end
end
