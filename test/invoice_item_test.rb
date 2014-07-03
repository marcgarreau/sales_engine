require "./test/test_helper"

class InvoiceItemTest < Minitest::Test
 attr_reader :result

 def setup
  @result = InvoiceItem.new(data)
 end

 def test_it_exists
  assert InvoiceItem
 end

 def data
   {
     id: "3",
     item_id: "4",
     invoice_id: "5",
     quantity: "45",
     unit_price: "11144",
     created_at: "2012-03-25 09:54:09 UTC",
     updated_at: "2012-03-25 09:54:09 UTC"
   }
 end

 def test_it_has_attributes
   assert result.id
   assert result.item_id
   assert result.invoice_id
   assert result.quantity
   assert result.created_at
   assert result.updated_at
 end

 def test_it_knows_its_id
   assert_equal "3", result.id
 end

 def test_it_knows_its_item_id
   assert_equal "4", result.item_id
 end

 def test_it_knows_its_invoice_id
   assert_equal "5", result.invoice_id
 end

 def test_it_knows_its_quantity
   assert_equal "45", result.quantity
 end

 def test_it_knows_its_created_at
   assert_equal "2012-03-25", result.created_at
 end

 def test_it_knows_its_updated_at
   assert_equal "2012-03-25", result.updated_at
 end

 def test

 end
end
