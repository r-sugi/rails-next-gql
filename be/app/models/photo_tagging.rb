# frozen_string_literal: true
class PhotoTagging < ApplicationRecord
  belongs_to :photo
  belongs_to :tag
end
