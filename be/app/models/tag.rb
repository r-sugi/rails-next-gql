# frozen_string_literal: true
class Tag < ApplicationRecord
  has_many :taggings, class_name: "PhotoTagging", dependent: :destroy
  has_many :photos, through: :taggings

  scope :with_name, -> (tags) { where(name: tags.pluck(:name)) }
end
