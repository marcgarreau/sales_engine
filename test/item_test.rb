require_relative 'test_helper.rb'

class ItemTest<Minitest::Test
  attr_reader :data,
              :item

  def setup
    @item = Item.new(data)
  end

  def data
    { :id => "1",
      :name => "Item Qui Esse",
      :description => "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
      :unit_price => "75107",
      :merchant_id => "3",
      :created_at => "2012-03-27 14:53:59 UTC",
      :updated_at => "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_has_attributes
    item.id
    item.name
    item.description
    item.unit_price
    item.merchant_id
    item.created_at
    item.updated_at
  end

  def test_it_knows_its_id
    assert_equal 1, item.id
  end

  def test_it_knows_its_name
    assert item.name == "Item Qui Esse"
  end

  def test_it_knows_its_description
    assert item.description == "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
  end

  def test_it_knows_its_price
    assert_equal BigDecimal.new("751.07"), item.unit_price
  end

  def test_it_has_a_merchant_id
    assert_equal 3, item.merchant_id 
  end

  def test_it_knows_when_it_was_created
    assert_equal Date.parse("2012-03-27"), item.created_at
  end

  def test_it_knows_when_it_was_updated
    assert item.updated_at == Date.parse("2012-03-27")
  end
end
