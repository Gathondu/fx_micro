class Mutations::CreateTransaction < Mutations::BaseMutation
  argument :customer_id, String, required: true
  argument :input_amount, String, required: true
  argument :input_currency_id, String, required: true
  argument :output_currency_id, String, required: true

  field :transaction, Types::TransactionType, null: false
  field :errors, [String], null: false

  def resolve(customer_id:, input_amount:, input_currency_id:, output_currency_id:)
    customer = Customer.find(customer_id)
    input_currency = Currency.find(input_currency_id)
    output_currency = Currency.find(output_currency_id)

    transaction = Transaction.create(
      customer: customer,
      input_amount: input_amount.to_f,
      input_currency: input_currency,
      output_amount: calculate_output_amount(amount: input_amount, input_currency: input_currency, output_currency: output_currency),
      output_currency: output_currency
    )

    if transaction.save
      { transaction: transaction, errors: [] }
    else
      { transaction: nil, errors: transaction.errors.full_messages }
    end
  end

  def calculate_output_amount(amount:, input_currency:, output_currency:)
    # adapt this function to use a currency api to convert output amount
    amount.to_f * 2
  end
end
