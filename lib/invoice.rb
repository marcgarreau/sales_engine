require 'date'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id          = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status      = row[:status]
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def items
    invoice_items.map(&:item)
  end

  def customer
    repository.engine.customer_repository.find_by_id(customer_id)
  end

  def customers
    repository.engine.customer_repository.find_all_by_id(customer_id)
  end

  def transactions
repository.engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

  def amount
    invoice_items.map(&:total_price).reduce(0, :+)
  end

  def quantity
    invoice_items.map(&:quantity).reduce(0, :+)
  end

  def has_successful_charge?
    transactions.any?(&:successful?)
  end

  def pending?
    transactions.none?(&:successful?)
  end

  def charge(credit_card_data)
    repository.engine.transaction_repository.create_transaction(credit_card_data, id)

  end
      # it "creates a transaction" do
      #   invoice = engine.invoice_repository.find_by_id(100)
      #   prior_transaction_count = invoice.transactions.count
      #
      #   invoice.charge(credit_card_number: '1111222233334444',  credit_card_expiration_date: "10/14", result: "success")
      #
      #   invoice = engine.invoice_repository.find_by_id(invoice.id)
      #   invoice.transactions.count.should == prior_transaction_count + 1



  protected

  attr_reader :repository
end
