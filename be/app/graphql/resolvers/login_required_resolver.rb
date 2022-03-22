# frozen_string_literal: true
module Resolvers
  class LoginRequiredResolver < Base
    def authorized?
      raise GraphQL::ExecutionError, "login required!!" unless context[:current_user]

      true
    end
  end
end
