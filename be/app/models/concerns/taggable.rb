# frozen_string_literal: true
module Taggable
  extend ActiveSupport::Concern

  # included hook
  included do
    has_many :taggings, class_name: "#{name}Tagging", dependent: :destroy
    has_many :tags, through: :taggings
  end

  # class method
  class_methods do
    def tagged_with(tag, *others, any: false)
      tags = [tag, *others]

      joins(:tags).
        merge(reflect_on_association(:tags).klass.with_name(tags)).
        merge(
          if tags.size == 1
            all
          elsif any
            distinct
          else
            group(primary_key).having("COUNT(*) = ?", tags.size)
          end
        )
    end
  end

  # instance method
  # def instance_method_name
  # end
end
