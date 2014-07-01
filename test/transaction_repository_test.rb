require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_it_can_add_merchants
    repo = TransactionRepository.new
    assert repo.transactions.count >= 10
  end
end
