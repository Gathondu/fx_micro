# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :customer, Types::CustomerType, null: false
    field :input_amount, String
    field :input_currency, Types::CurrencyType, null: false
    field :output_amount, String
    field :output_currency, Types::CurrencyType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
