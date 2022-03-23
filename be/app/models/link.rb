# frozen_string_literal: true
class Link < ApplicationRecord
  belongs_to :user

  # has_many :votes, dependent: :destroy

  validates :url, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
end
