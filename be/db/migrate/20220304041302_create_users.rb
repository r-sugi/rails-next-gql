# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end
