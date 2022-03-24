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

  let(:transaction_query) do
    <<~GQL
      query($id: ID!) {
        transaction(id: $id) {
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
      }
    GQL
  end

  let(:customer) { create(:customer) }
  let(:input_currency) { create(:input_currency) }
  let(:output_currency) { create(:output_currency) }

  before do
    @outcome = execute_graphql(
      mutation,
      variables: {
        customerId: customer.id,
        inputAmount: '30',
        inputCurrencyId: input_currency.id,
        outputCurrencyId: output_currency.id
      },
    )

    @expected_outcome = {
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
  end

  it 'creates a transaction successfully' do
    expect(@outcome['data']['createTransaction']['transaction']).to eq @expected_outcome
  end

  it 'persists the transactions and they can be queried' do
    transactions = execute_graphql(transactions_query)
    transaction = execute_graphql(
      transaction_query,
      variables: { id:  transactions['data']['transactions'][0]['id']}
    )

    expect(transactions['data']['transactions'].count).to eq 1
    expect(transaction['data']['transaction']).to eq @expected_outcome
  end
end
