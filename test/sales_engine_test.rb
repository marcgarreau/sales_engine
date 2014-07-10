require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

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
    assert_equal 8, item.invoice_items.count
  end

  def test_it_can_find_a_merchant_by_title
    item = @engine.item_repository.find_by_name "Item Saepe Ipsum"
    assert "Kilback Inc", item.merchant.name
  end

  def test_it_can_find_an_invoice
    invoice_item = @engine.invoice_item_repository.find_by_id 16934
    assert "Item Cupiditate Magni", invoice_item.item.name
  end

  def test_invoice_item_has_an_invoice
    invoice_item = @engine.invoice_item_repository.find_by_id 16934
    assert invoice_item.invoice
  end

  def test_invoice_has_many_invoice_items
    invoice = @engine.invoice_repository.find_by_id 1
    assert_equal 8, invoice.invoice_items.map(&:id).count
  end

  def test_invoice_has_many_items
    invoice = @engine.invoice_repository.find_by_id 1
    assert_equal 8, invoice.items.map(&:id).count
  end

  def test_it_finds_items_by_merchant
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal 33, merchant.items.map(&:id).count
  end

  def test_it_has_the_right_number_of_items
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal 1, merchant.items.count
  end

  def test_it_can_find_invoices_by_merchant
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert_equal 43, merchant.invoices.map(&:id).count
  end

  def test_it_can_has_the_right_number_of_invoices
    merchant = @engine.merchant_repository.find_by_name "Kirlin, Jakubowski and Smitham"
    assert merchant.invoices.count >= 3
  end

  def test_it_has_the_right_number_of_transactions
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 3, invoice.transactions.count
  end

  def test_it_has_the_right_number_of_items
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 8, invoice.items.count
  end

  def test_it_can_find_customers_by_name
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal "Eric", invoice.customer.first_name
    assert_equal "Bergnaum", invoice.customer.last_name
  end

  def test_it_has_the_right_number_of_invoice_items
    invoice = @engine.invoice_repository.find_by_id 1001
    assert_equal 8, invoice.invoice_items.count
  end

  def test_it_can_merchant_by_invoice
    invoice = @engine.invoice_repository.find_by_id 901
    merchant = invoice.merchant
    assert_equal "Eichmann-Turcotte", merchant.name
  end

  def test_it_can_find_items_best_day
    item = @engine.item_repository.find_by_id(901)
    assert_equal Date.parse("2012-03-20"), item.best_day
  end

  def test_it_finds_transactions_from_a_customer
    customer = @engine.customer_repository.find_by_id(45)
    assert_equal 8, customer.transactions.count
  end

  def test_it_finds_a_customers_favorite_merchant
    customer = @engine.customer_repository.find_by_id(2)
    assert_equal "Shields, Hirthe and Smith", customer.favorite_merchant.name
  end

  def test_it_can_find_items_by_total_number_sold
    most = @engine.item_repository.most_items(3)
    assert_equal "Item Dicta Autem", most.first.name
  end

  def test_it_can_find_favorite_customer
    merchant = @engine.merchant_repository.find_by_name "Terry-Moore"
    assert_equal "Jayme", merchant.favorite_customer.first_name
  end

  def test_it_returns_all_revenue_for_a_specific_date
    date = Date.parse "Tue, 20 Mar 2012"
    revenue = @engine.merchant_repository.revenue(date)
    assert_equal BigDecimal.new("2549722.91"), revenue
  end

  def test_it_finds_customer_that_bought_most_items
    assert_equal 622, @engine.customer_repository.most_items.id
  end

  def test_it_finds_customer_who_generated_most_revenue
    assert_equal 601, engine.customer_repository.most_revenue.id
  end

  def test_it_returns_zero_for_pending_invoices_by_customer_with_none
    customer = @engine.customer_repository.find_by_id(2)
    assert_equal 0, customer.pending_invoices.count
  end

  def test_it_can_find_pending_invoices_by_customer
    customer = @engine.customer_repository.find_by_id(307)
    assert_equal 1, customer.pending_invoices.count
  end

  #def test_your_business_intelligence
end
