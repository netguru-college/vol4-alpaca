class CreateAlpacaSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :alpaca_skills do |t|
      t.integer :level
      t.references :alpaca, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
