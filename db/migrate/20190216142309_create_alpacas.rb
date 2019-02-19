# frozen_string_literal: true

class CreateAlpacas < ActiveRecord::Migration[5.2]
  def change
    create_table :alpacas do |t|
      t.string :name, null: false
      t.string :quote, null: false
      t.binary :gender
      t.string :picture_url, null: false

      t.timestamps
    end
  end
end
