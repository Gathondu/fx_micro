# frozen_string_literal: true

module Types
  class CountryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :alpha2, String
    field :alpha3, String
    field :iso_number, String
    field :currencies_iso_number, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
