require_relative './test_helper.rb'

class ItemRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_repository
    repo = ItemRepository.new
    assert_equal 0, repo.items.count
  end

  def test_it_can_add_items_to_the_repository
    repo = ItemRepository.new
    repo.build_items
    assert repo.items.count >= 10
  end
end
