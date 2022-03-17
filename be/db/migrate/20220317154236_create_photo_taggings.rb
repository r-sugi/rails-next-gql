# frozen_string_literal: true
# rubocop:disable Discourse/NoAddReferenceOrAliasesActiveRecordMigration

class CreatePhotoTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_taggings do |t|
      t.references :photo, type: :bigint, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end

    add_index :photo_taggings, [:photo_id, :tag_id], unique: true
  end
end
