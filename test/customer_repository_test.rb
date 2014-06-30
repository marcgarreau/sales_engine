require_relative './test_helper.rb'

class CustomerRepositoryTest < Minitest::Test

  def test_it_initializes_with_an_empty_customers_array
    repo = CustomerRepository.new
    assert_equal 0, repo.customers.count
  end

  def test_it_can_add_customers
    repo = CustomerRepository.new
    repo.build_customers
    assert repo.customers.count >= 10
  end
end
