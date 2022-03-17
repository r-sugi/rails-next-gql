# frozen_string_literal: true
class Tag < ApplicationRecord
  has_many :taggings, class_name: "PhotoTagging", dependent: :destroy
  has_many :photos, through: :taggings
end
