class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(row, repository=nil)
    @id                          = row[:id]
    @invoice_id                  = row[:invoice_id]
    @credit_card_number          = row[:credit_card_number]
    @credit_card_expiration_date = row[:credit_card_expiration_date]
    @result                      = row[:result]
    @created_at                  = row[:created_at]
    @updated_at                  = row[:updated_at]
    @repository                  = repository
  end

  def invoice
    results = @repository.engine.invoice_repository.find_by_id(invoice_id)
    # results = InvoiceRepository.new.find_by_id(self.invoice_id)
  end
end
