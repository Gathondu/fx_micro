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
  end
end
