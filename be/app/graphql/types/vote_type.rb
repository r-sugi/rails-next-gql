# frozen_string_literal: true
module Types
  class VoteType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false
    field :link, LinkType, null: false
  end
end
