# frozen_string_literal: true
module Resolvers
  class LinksSearch < LoginRequiredResolver
    type [Types::LinkType], null: false

    def resolve
      Link.all
    end
  end
end
