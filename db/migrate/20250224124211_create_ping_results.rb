# frozen_string_literal: true

class CreatePingResults < ActiveRecord::Migration[8.0]
  def change
    create_table :ping_results do |t|
      t.references :ip, null: false, foreign_key: true
      t.float :rtt

      t.timestamps
    end
  end
end
