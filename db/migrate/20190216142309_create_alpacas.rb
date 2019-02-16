class CreateAlpacas < ActiveRecord::Migration[5.2]
  def change
    create_table :alpacas do |t|
      t.string :name
      t.string :quote
      t.binary :gender
      t.string :picture_url
      t.string :string

      t.timestamps
    end
  end
end
