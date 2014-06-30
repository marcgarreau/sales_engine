require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_it_initializes_with_an_empty_merchants_array
    repo = TransactionRepository.new
    assert_equal 0, repo.transactions.count
  end

  def test_it_can_add_merchants
    repo = TransactionRepository.new
    repo.build_transactions
    assert repo.transactions.count >= 10
  end
end
