# frozen_string_literal: true
module Types
  class QueryMetaType < Types::BaseObject
    graphql_name "_QueryMeta"

    field :count, Int, null: false

    def count
      object
    end
  end
end
