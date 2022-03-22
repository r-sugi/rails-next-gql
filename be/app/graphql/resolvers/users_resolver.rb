# frozen_string_literal: true
module Resolvers
  class UsersResolver < LoginRequiredResolver
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
