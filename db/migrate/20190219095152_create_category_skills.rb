class CreateCategorySkills < ActiveRecord::Migration[5.2]
  def change
    create_table :category_skills do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true
      t.integer :weight


      t.timestamps
    end
  end
end
