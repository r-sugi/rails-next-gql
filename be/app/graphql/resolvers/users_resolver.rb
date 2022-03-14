module Resolvers
  class UsersResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
