# frozen_string_literal: true

class CreateAlpacaEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :alpaca_events do |t|
      t.references :alpaca, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false

      t.timestamps
    end
  end
end
