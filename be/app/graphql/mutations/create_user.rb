# frozen_string_literal: true
module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    field :user, Types::UserType, null: false

    def resolve(name: nil, auth_provider: nil)
      result = UserCreateService.call(
        name: name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password)
      )

      if result[:valid]
        result[:user]
      else
        build_errors(result[:user])
        nil
      end
    end

    # TODO: 共通化
    def build_errors(record)
      record.errors.map do |attribute, message|
        message = record[attribute] + " " + message
        context.add_error(ValidationError.new(message: message, attribute: attribute))
      end
    end
  end
end
