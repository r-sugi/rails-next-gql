# frozen_string_literal: true
module Resolvers
  class UsersResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
