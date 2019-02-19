# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :bid

      t.timestamps
    end
  end
end
