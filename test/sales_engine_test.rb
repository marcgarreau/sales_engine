require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
    @engine.startup
  end

  def test_it_finds_invoices_by_customer_id
    customer = @engine.customer_repository.find_by_id 999
    assert customer.invoices.count == 7
  end

  def test_it_can_find_an_invoice_from_a_transaction_or_something
    transaction = @engine.transaction_repository.find_by_id 1138
    invoice_customer = @engine.customer_repository.find_by_id 192
    assert_equal transaction.invoice.customer.first_name, invoice_customer.first_name
  end
end
