# frozen_string_literal: true
require "rails_helper"

RSpec.describe "CreateLink", type: :request do
  describe "resolver" do
    let(:user) { create(:user) }

    def find(args)
      ::Resolvers::LinksSearch.call(nil, args, nil)
    end

    def create_link(**attributes)
      Link.create! attributes.merge(user: user)
    end

    it "create a new link" do
      link1 = create_link description: "test1", url: "http://test1.com"
      link2 = create_link description: "test2", url: "http://test2.com"
      link3 = create_link description: "test3", url: "http://test3.com"
      link4 = create_link description: "test4", url: "http://test4.com"

      result = find(
        filter: {
          description_contains: "test1",
          OR: [{
            url_contains: "test2",
            OR: [{
              url_contains: "test3"
            }]
          }, {
            description_contains: "test2"
          }]
        }
      )

      assert_equal result.map(&:description).sort, [link1, link2, link3].map(&:description).sort
    end
  end
end
