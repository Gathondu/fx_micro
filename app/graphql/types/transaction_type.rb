# frozen_string_literal: true

module Types
  class TransactionType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, Types::UuidType, null: false
    field :input_amount, Float
    field :input_currency_id, Types::UuidType, null: false
    field :output_amount, Float
    field :output_currency_id, Types::UuidType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
