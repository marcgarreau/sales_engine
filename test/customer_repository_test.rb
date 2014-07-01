require_relative './test_helper.rb'

class CustomerRepositoryTest < Minitest::Test

  def setup
    @repo = CustomerRepository.new("./data/fixtures/fake_customers.csv")
  end

  def test_it_initializes_with_customers
    assert @repo.customers.count >= 10
  end

  def test_it_can_find_by_last_name
    result = @repo.find_by_last_name("Toy")
    assert_equal "Mariah", result.first_name
    #find method always returns one value
  end

  def test_it_can_find_all_by_first_name
    results = @repo.find_all_by_first_name("Mariah")
    assert_equal 2, results.count
    #find_by method returns an array
  end
end
