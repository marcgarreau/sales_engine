require "./test/test_helper"

class TransactionTest < Minitest::Test
 attr_reader :result

 def setup
  @result = Transaction.new(data)
 end

 def test_it_exists
  assert Transaction
 end

 def data
   {
     id: "3",
     invoice_id: "4",
     credit_card_number: "5555555555555555",
     credit_card_expiration_date: "",
     result: "success",
     created_at: "2012-03-25 09:54:09 UTC",
     updated_at: "2012-03-25 09:54:09 UTC"
   }
 end

 def test_it_has_attributes
   assert result.id
   assert result.invoice_id
   assert result.credit_card_number
   assert result.credit_card_expiration_date
   assert result.result
   assert result.created_at
   assert result.updated_at
 end

 def test_it_knows_its_id
   assert_equal "3", result.id
 end

 def test_it_knows_its_invoice_id
   assert_equal "4", result.invoice_id
 end

 def test_it_knows_its_credit_card_number
   assert_equal "5555555555555555", result.credit_card_number
 end

 def test_it_knows_its_credit_card_expiration_date
   assert_equal "", result.credit_card_expiration_date
 end

 def test_it_knows_its_result
   assert_equal "success", result.result
 end

 def test_it_knows_its_created_at
   assert_equal "2012-03-25", result.created_at
 end

 def test_it_knows_its_updated_at
   assert_equal "2012-03-25", result.updated_at
 end
end
