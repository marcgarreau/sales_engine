require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @repo = TransactionRepository.new("./data/fixtures/fake_transactions.csv")
  end

  def test_it_initializes_with_transactions
    assert @repo.transactions.count >= 10
  end

  def test_it_can_find_by_credit_card_number
    result = @repo.find_by_credit_card_number("4515551623735607")
    assert_equal "5", result.invoice_id
    #find method always returns one value
  end

  def test_it_can_find_all_by_result
    results = @repo.find_all_by_result("success")
    assert_equal 10, results.count
    #find_by method returns an array
  end

end
