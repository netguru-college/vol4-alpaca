# frozen_string_literal: true

class CreateCategorySkills < ActiveRecord::Migration[5.2]
  def change
    create_table :category_skills do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true
      t.integer :weight, null: false
      t.timestamps
    end

    reversible do |change|
      change.up do
        execute 'ALTER TABLE Category_Skills ADD CONSTRAINT weight_value CHECK (weight > 0 )'
      end
      change.down do
        execute 'ALTER TABLE Category_Skills DROP CONSTRAINT weight_value'
      end
    end
  end
end
