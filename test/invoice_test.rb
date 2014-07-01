require "./test/test_helper"

class InvoiceTest < Minitest::Test
 attr_reader :result

 def setup
  @result = Invoice.new(data)
 end

 def test_it_exists
  assert Invoice
 end

 def data
   {
     id: "3",
     customer_id: "4",
     merchant_id: "5",
     status: "shipped",
     created_at: "2012-03-25 09:54:09 UTC",
     updated_at: "2012-03-25 09:54:09 UTC"
   }
 end

 def test_it_has_attributes
   assert result.id
   assert result.customer_id
   assert result.merchant_id
   assert result.status
   assert result.created_at
   assert result.updated_at
 end

 def test_it_knows_its_id
   assert_equal "3", result.id
 end

 def test_it_knows_its_customer_id
   assert_equal "4", result.customer_id
 end

 def test_it_knows_its_merchant_id
   assert_equal "5", result.merchant_id
 end

 def test_it_knows_its_status
   assert_equal "shipped", result.status
 end

 def test_it_knows_its_created_at
   assert_equal "2012-03-25 09:54:09 UTC", result.created_at
 end

 def test_it_knows_its_updated_at
   assert_equal "2012-03-25 09:54:09 UTC", result.updated_at
 end
end
