# frozen_string_literal: true
class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
