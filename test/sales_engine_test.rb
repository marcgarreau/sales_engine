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
    assert customer.invoices.count >= 7
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

  def test_invoice_item_has_an_invoice
    invoice_item = @engine.invoice_item_repository.find_by_id 16934
    assert invoice_item.invoice
  end

  def test_invoice_has_many_invoice_items
    invoice = @engine.invoice_repository.find_by_id 1
    assert_equal %w(1 2 3 4 5 6 7 8), invoice.invoice_items.map(&:id)
  end

  def test_invoice_has_many_items
    invoice = @engine.invoice_repository.find_by_id 1
    assert_equal %w(2 3 4 5 6 7 8 9), invoice.items.map(&:id)
  end

  def test_it_finds_items_by_merchant
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal %w(1880), merchant.items.map(&:id)
  end

  def test_it_has_the_right_number_of_items
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal 1, merchant.items.count
  end

  def test_it_can_find_invoices_by_merchant
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal %w(1 6 846 19), merchant.invoices.map(&:id)
  end

  def test_it_can_has_the_right_number_of_invoices
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert merchant.invoices.count >= 3
  end

  def test_it_has_the_right_number_of_transactions
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 1, invoice.transactions.count
  end

  def test_it_has_the_right_number_of_items
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 2, invoice.items.count
  end

  def test_it_can_find_an_item_with_a_specific_name
    invoice = @engine.invoice_repository.find_by_id 1001
    item = invoice.items.find {|i| i.name == 'Item Accusamus Officia'}
    assert item
  end

  def test_it_can_find_customers_by_name
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal "Eric", invoice.customer.first_name
    assert_equal "Bergnaum", invoice.customer.last_name
  end

  def test_it_has_the_right_number_of_invoice_items
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 2, invoice.invoice_items.count
  end

  def test_it_can_find_an_invoice_item_by_name
    invoice = @engine.invoice_repository.find_by_id 1001
    item = invoice.invoice_items.find {|ii| ii.item.name == 'Item Accusamus Officia' }
    assert item
  end

  def test_it_can_merchant_by_invoice
    invoice = @engine.invoice_repository.find_by_id 1001
    merchant = invoice.merchant
    assert_equal "Kilback Inc", merchant.name
  end

  def test_it_can_find_items_best_day
    item = @engine.item_repository.find_by_id("1")
    assert_equal Date.parse("2012-03-25"), item.best_day
  end

  def test_it_finds_a_list_of_transactions_a_customer_has_had
    customer = @engine.customer_repository.find_by_id("2")
    assert customer.transactions.count >= 2
  end

  def test_it_finds_a_customers_favorite_merchant
    customer = @engine.customer_repository.find_by_id("2")
    assert_equal "Fake1", customer.favorite_merchant.name
  end

  def test_it_can_find_items_by_total_number_sold
    most = @engine.item_repository.most_items(37)
    assert_equal "Something", most.first.name
  end
end
