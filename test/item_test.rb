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
    assert item.id == "1"
  end

  def test_it_knows_its_name
    assert item.name == "Item Qui Esse"
  end

  def test_it_knows_its_description
    assert item.description == "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
  end

  def test_it_knows_its_price
    assert item.unit_price == "75107"
  end

  def test_it_has_a_merchant_id
    assert item.merchant_id == "3"
  end

  def test_it_knows_when_it_was_created
    assert item.created_at == "2012-03-27 14:53:59 UTC"
  end

  def test_it_knows_when_it_was_updated
    assert item.updated_at == "2012-03-27 14:53:59 UTC"
  end
end
