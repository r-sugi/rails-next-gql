# frozen_string_literal: true
require "rails_helper"

RSpec.describe "CreateLink", type: :request do
  describe "resolver" do
    let(:user) { create(:user) }

    def perform(user: nil, **args)
      Mutations::CreateLink.new(object: nil, field: nil, context: { current_user: user }).resolve(**args)
    end

    it "create a new link" do
      link = perform(
        url: "http://example.com",
        description: "description",
        user: user
      )

      assert link.persisted?
      assert_equal link.description, "description"
      assert_equal link.url, "http://example.com"
    end
  end
end
