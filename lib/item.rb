class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(row)
    @id           = row[:id]
    @name         = row[:name]
    @description  = row[:description]
    @unit_price   = row[:unit_price]
    @merchant_id  = row[:merchant_id]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
  end

  def invoice_items
    results = InvoiceItemRepository.new.find_all_by_item_id(self.id)
  end

  def merchant
    a = InvoiceItemRepository.new.find_by_item_id(self.id) #449 item_id passed in
    b = InvoiceRepository.new.find_by_invoice_id(a.invoice_id) #4458 invoice item id passed in
    x = MerchantRepository.new.find_by_id(b.merchant_id) #23 or 26? merch_id passed in
  end
end
