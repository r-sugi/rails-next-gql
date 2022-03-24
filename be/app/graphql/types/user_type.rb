# frozen_string_literal: true
module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :votes, [VoteType], null: false
    field :links, [LinkType], null: false
    field :total_links, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def links
      Loaders::AssociationLoader.for(User, :links).load(object)
    end

    def total_links
      Loaders::AssociationCountLoader.for(User, :links).load(object)
    end
  end
end
