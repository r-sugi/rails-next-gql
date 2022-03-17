# frozen_string_literal: true
class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts, id: false do |t|
      t.bigint :id, null: false, primary_key: true
      t.decimal :balance, null: false, precision: 19, scale: 4
      t.string :currency, null: false
      t.timestamps
    end
  end
end
