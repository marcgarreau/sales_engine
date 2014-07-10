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
    assert_equal 1, merchant.id
  end

  def test_it_knows_its_name
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_knows_when_it_was_created
    assert Date.parse("2012-03-27"), merchant.created_at
  end

  def test_it_knows_when_it_was_updated
    assert Date.parse("2012-03-27"), merchant.updated_at
  end

  #def test_your_business_intelligence
end
