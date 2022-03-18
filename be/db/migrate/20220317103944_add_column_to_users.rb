# frozen_string_literal: true
class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.column :password_digest, :string, after: :phone_number
      t.column :terms_of_service, :boolean, after: :password_digest
    end

    add_index :users, :email, unique: true
  end
end
