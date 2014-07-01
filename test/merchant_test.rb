require_relative 'test_helper.rb'

class MerchantTest<Minitest::Test

  def test_it_has_an_id
    merchant = Merchant.new(:id=>"1")
    assert "1", merchant.id
  end

  def test_it_has_a_name
    merchant = Merchant.new(:name => "Walmart")
    assert "Walmart", merchant.name
  end

  def test_it_know_when_it_was_created
    merchant = Merchant.new(:created_at => "12:59:00")
    assert "12:59:00", merchant.created_at
  end

  def test_it_knows_when_it_was_updated
    merchant = Merchant.new(:updated_at => "tuesday")
    assert "tuesday", merchant.updated_at
  end
end
