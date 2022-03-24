# frozen_string_literal: true
module Resolvers
  class UsersResolver < LoginRequiredResolver
    description "Find all users"
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
