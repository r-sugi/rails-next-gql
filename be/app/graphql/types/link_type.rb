# frozen_string_literal: true
module Types
  class LinkType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :posted_by, UserType, null: false
    field :votes, [Types::VoteType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def posted_by
      Loaders::RecordLoader.for(User).load(object.user_id)
    end
  end
end
