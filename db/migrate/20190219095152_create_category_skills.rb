class CreateCategorySkills < ActiveRecord::Migration[5.2]
  def change
    create_table :category_skills do |t|

      t.timestamps
    end
  end
end
