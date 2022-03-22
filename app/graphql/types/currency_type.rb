# frozen_string_literal: true

module Types
  class CurrencyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :iso_code, String
    field :iso_number, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
