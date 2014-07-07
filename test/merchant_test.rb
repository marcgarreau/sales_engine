require_relative 'test_helper.rb'

class MerchantTest<Minitest::Test
  attr_reader :data,
              :merchant

  def setup
    @merchant = Merchant.new(data)
  end

  def data
    { :id => "1",
      :name => "Schroeder-Jerde",
      :created_at => "2012-03-27 14:53:59 UTC",
      :updated_at => "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_has_attributes
    merchant.id
    merchant.name
    merchant.created_at
    merchant.updated_at
  end

  def test_it_knows_its_id
    assert merchant.id == "1"
  end

  def test_it_knows_its_name
    assert merchant.name == "Schroeder-Jerde"
  end

  def test_it_knows_when_it_was_created
    assert merchant.created_at == Date.parse("2012-03-27")
  end

  def test_it_knows_when_it_was_updated
    assert merchant.updated_at == Date.parse("2012-03-27")
  end

  def test_that_it_finds_invoices_by_date
    skip
    date = Date.parse("2012-03-27")
    binding.pry
    x = merchant.invoices_by_date(date)
    assert_equal 3, x.count
  end

  def test_it_returns_all_revenue_for_a_specific_date
    skip
    date = Date.parse "Tue, 20 Mar 2012"
    revenue = @merchant.revenue(date)
    assert_equal BigDecimal.new("2549722.91"), revenue
  end
end
