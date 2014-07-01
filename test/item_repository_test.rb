require_relative './test_helper.rb'

class ItemRepositoryTest < Minitest::Test

  def test_it_can_add_items_to_the_repository
    repo = ItemRepository.new
    assert repo.items.count >= 10
  end
end
