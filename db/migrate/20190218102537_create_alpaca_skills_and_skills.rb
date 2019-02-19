# frozen_string_literal: true

class CreateAlpacaSkillsAndSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end

    create_table :alpaca_skills do |t|
      t.integer :level, null: false
      t.references :alpaca, foreign_key: true, null: false
      t.references :skill, foreign_key: true, null: false

      t.timestamps
    end

    add_index :alpaca_skills, %i[alpaca_id skill_id], unique: true

    reversible do |change|
      change.up do
        execute 'ALTER TABLE Alpaca_Skills ADD CONSTRAINT level_range CHECK (level >= 1 AND level <= 100 )'
      end
      change.down do
        execute 'ALTER TABLE Alpaca_Skills DROP CONSTRAINT level_range'
      end
    end
  end
end
