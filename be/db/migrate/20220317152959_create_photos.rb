# frozen_string_literal: true
class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: false do |t|
      t.bigint :id, null: false, primary_key: true
      t.timestamps
    end
  end
end
