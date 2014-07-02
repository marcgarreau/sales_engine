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

  def test_it_can_find_invoice_items_by_name
    item = @engine.item_repository.find_by_name "Item Saepe Ipsum"
    assert_equal 1, item.invoice_items.count
  end

  def test_it_can_find_a_merchant_by_title
    item = @engine.item_repository.find_by_name "Item Saepe Ipsum"
    assert item.merchant.name == "Kilback Inc"
  end

  def test_it_can_find_an_invoice
    invoice_item = @engine.invoice_item_repository.find_by_id 16934
    assert invoice_item.item.name == "Item Cupiditate Magni"
  end

  def test_something
    invoice_item = @engine.invoice_item_repository.find_by_id 16934
    assert invoice_item.invoice
  end

end
