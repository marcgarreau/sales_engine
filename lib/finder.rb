# refactor finders, use (row, self) --> within repo.map to build in reference.

module CustomerFinder
  def all
    @customers
  end

  def random
    @customers.shuffle.first
  end

  def find_by_last_name(name)
    results = @customers.find {|customer| customer.last_name == name}
  end

  def find_all_by_first_name(name)
    results = @customers.find_all {|customer| customer.first_name == name}
  end

  def find_by_id(customer_id)
    results = @customers.find {|customer| customer.id == customer_id.to_s}
  end
end

module InvoiceItemFinder
  def all
    @invoice_items
  end

  def random
    @invoice_items.shuffle.first
  end

  def find_by_item_id(id)
    result = @invoice_items.find {|invoice_item| invoice_item.item_id == id}
  end

  def find_all_by_quantity(quant)
    results = @invoice_items.find_all {|invoice_item| invoice_item.quantity == quant}
  end

  def find_all_by_item_id(id)
    results = @invoice_items.find_all {|invoice_item| invoice_item.item_id == id}
  end

  def find_by_id(id)
    results = @invoice_items.find {|invoice_item|invoice_item.id == id}
  end
end

module InvoiceFinder
  def all
    @invoices
  end

  def random
    @invoices.shuffle.first
  end

  def find_by_status(status)
    results = @invoices.find {|invoice| invoice.status == status}
  end

  def find_all_by_status(status)
    results = @invoices.find_all {|invoice| invoice.status == status}
  end

  def find_all_by_customer_id(id)
    results = @invoices.find_all {|invoice| invoice.customer_id == id}
  end

  def find_by_id(invoice_id)
    results = @invoices.find {|invoice| invoice.id == invoice_id.to_s}
  end

  # def find_by_invoice_id(id)
  #   results = @invoices.find {|invoice| invoice.merchant_id == id}
  # end
end

module ItemFinder
  def all
    @items
  end

  def random
    @items.shuffle.first
  end

  def find_by_unit_price(unit_price)
    results = @items.find {|item| item.unit_price == unit_price}
  end

  def find_all_by_name(name)
    results = @items.find_all {|item| item.name == name}
  end

  def find_by_name(name)
    results = @items.find {|item| item.name == name}
  end
end

module MerchantFinder
  def all
    @merchants
  end

  def random
    @merchants.shuffle.first
  end

  def find_by_name(name)
    results = @merchants.find {|merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    results = @merchants.find_all {|merchant| merchant.name == name}
  end

  def find_by_id(id)
    results = @merchants.find {|merchant| merchant.id == id}
  end
end

module TransactionFinder
  def all
    @transactions
  end

  def random
    @transactions.shuffle.first
  end

  def find_by_credit_card_number(credit_card_number)
    collection = @transactions.find {|transaction| transaction.credit_card_number == credit_card_number}
  end

  def find_all_by_result(result)
    collection = @transactions.find_all {|transaction| transaction.result == result}
  end

  def find_by_id(customer_id)
    results = @transactions.find {|transaction| transaction.id == customer_id.to_s}
  end
end

# ????????????????
module FindAll
  def all
    self
  end
end

# ????????????????
module FindRandom
  def random
    self.sample
  end
end
