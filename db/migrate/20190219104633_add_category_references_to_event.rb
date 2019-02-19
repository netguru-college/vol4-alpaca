class AddCategoryReferencesToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :category, index: true, foreign_key: true, null: false
  end
end
