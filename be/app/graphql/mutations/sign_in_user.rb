# frozen_string_literal: true
module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      # basic validation
      return unless credentials

      user = User.find_by email: credentials[:email]

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(credentials[:password])

      jwt = Auth.issue({ user: user.id })

      { user: user, token: jwt }
    end
  end
end
