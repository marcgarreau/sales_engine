require_relative './test_helper.rb'

class CustomerRepositoryTest < Minitest::Test

  def test_it_initializes_with_customers
    repo = CustomerRepository.new
    assert repo.results.count >= 10
  end

  def test_it_can_find_by_last_name
    c = CustomerRepository.new
    c.find_by_last_name("Toy")
    assert_equal 1, c.results.count
  end
end
