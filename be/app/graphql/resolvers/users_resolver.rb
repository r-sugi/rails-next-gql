# frozen_string_literal: true
module Resolvers
  class UsersResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false

    # TODO:
    def authorized?
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, "login required!!" unless context[:current_user]
      true
    end

    def resolve
      User.all
    end
  end
end
