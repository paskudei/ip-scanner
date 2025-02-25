# frozen_string_literal: true

class CreateIps < ActiveRecord::Migration[8.0]
  def change
    create_table :ips do |t|
      t.inet :address, null: false
      t.boolean :enabled, null: false, default: true

      t.timestamps

      t.index :address, unique: true
    end
  end
end
