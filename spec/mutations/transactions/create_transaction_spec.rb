require 'rails_helper'

RSpec.describe Mutations::CreateTransaction, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation(
        $customerId: String!
        $inputAmount: String!
        $inputCurrencyId: String!
        $outputCurrencyId: String!
      ) {
          createTransaction(input: {
            customerId: $customerId
            inputAmount: $inputAmount
            inputCurrencyId: $inputCurrencyId
            outputCurrencyId: $outputCurrencyId
          }) {
            transaction {
              customer {
                id
              }
              inputAmount
              inputCurrency {
                id
              }
              outputAmount
              outputCurrency {
                id
              }
            }
            errors
          }
      }
    GQL
  end
  let(:transactions_query) do
    <<~GQL
      query {
        transactions {
          id
        }
      }
    GQL
  end

  let(:customer) { create(:customer) }
  let(:input_currency) { create(:input_currency) }
  let(:output_currency) { create(:output_currency) }

  it 'creates a transaction successfully' do
    expected_outcome = {
      "customer" => {
        "id" => customer.id
      },
      "inputAmount" => '30.0',
      "inputCurrency" => {
        "id" => input_currency.id
      },
      "outputAmount" => '60.0',
      "outputCurrency" => {
        "id" => output_currency.id
      },
    }
    outcome = execute_graphql(
      mutation,
      variables: {
        customerId: customer.id,
        inputAmount: '30',
        inputCurrencyId: input_currency.id,
        outputCurrencyId: output_currency.id
      },
    )
    transactions = execute_graphql(transactions_query)

    expect(outcome['data']['createTransaction']['transaction']).to eq expected_outcome
    expect(transactions['data']['transactions'].count).to eq 1
  end
end
