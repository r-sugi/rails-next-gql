# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    # authenticate
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
