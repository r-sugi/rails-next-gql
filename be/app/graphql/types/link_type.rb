# frozen_string_literal: true
module Types
  class LinkType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :posted_by, UserType, null: false, method: :user
    # field :votes, [Types::VoteType], null: false
  end
end
