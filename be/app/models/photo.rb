# frozen_string_literal: true
class Photo < ApplicationRecord
  has_many :taggings, class_name: "PhotoTagging", dependent: :destroy
  has_many :tags, through: :taggings

  # photo_taggingsテーブルのphoto_idとtag_idカラムに複合ユニーク制約、tagsテーブルのnameカラムに
  # ユニーク制約が設定されている前提の実装であることに注意
  def self.tagged_with(tag, *others, any: false)
    tags = [tag, *others]

    joins(:tags)
      .merge(reflect_on_association(:tags).klass.with_name(tags))
      .merge(
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
