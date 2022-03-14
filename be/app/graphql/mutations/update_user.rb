# frozen_string_literal: true
module Mutations
  class UpdateUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :id, ID, required: true
    argument :name, String, required: true
    argument :email, String, required: false

    def resolve(**args)
      params = args.to_hash
      user = User.find(params[:id])
      user.update!(params)
      {
        user: user
      }
    end
  end
end
