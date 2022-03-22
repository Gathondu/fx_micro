module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # countries
    field :countries, [Types::CountryType], null: false

    def countries
      Country.all
    end

    field :country, Types::CountryType, null: false do
      argument :id, ID, required: true
    end

    def country(id:)
      Country.find(id)
    end

    # Currencies
    field :currencies, [Types::CurrencyType], null: false
    field :currency, Types::CurrencyType, null: false do
      argument :id, ID, required: true
    end

    def currencies
      Currency.all
    end

    def currency(id:)
      Currency.find(id)
    end

    # customers
    field :customers, [Types::CustomerType], null: false
    field :customer, Types::CustomerType, null: false do
      argument :id, ID, required: true
    end

    def customers
      Customer.all
    end

    def customer(id:)
      Customer.find(id)
    end

    # transactions
    field :transactions, [Types::TransactionType], null: false
    field :transaction, Types::TransactionType, null: false do
      argument :id, ID, required: true
    end

    def transactions
      Transaction.all
    end

    def transaction(id:)
      Transaction.find(id)
    end
  end
end
