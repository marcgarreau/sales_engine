require_relative './test_helper.rb'

class ItemRepositoryTest < Minitest::Test

  def setup
    @repo = ItemRepository.new("./data/fixtures/fake_items.csv")
  end

  def test_it_initializes_with_customers
    assert @repo.items.count >= 10
  end

  def test_it_can_find_by_unit_price
    result = @repo.find_by_unit_price("75107")
    assert_equal "Item Qui Esse", result.name
    #find method always returns one value
  end

  def test_it_can_find_all_by_name
    results = @repo.find_all_by_name("Item Expedita Fuga")
    assert_equal 1, results.count
    #find_by method returns an array
  end

  def test_it_usually_returns_different_random_things
    item_one = @repo.random
    item_two = @repo.random
    10.times do
      break if item_one.id == item_two.id
      item_two = @repo.random
      refute_equal item_one.to_s, item_two.to_s, "Broke due to random outcome. Run again."
    end
  end


end
