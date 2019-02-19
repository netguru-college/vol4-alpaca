class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :bid

      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
