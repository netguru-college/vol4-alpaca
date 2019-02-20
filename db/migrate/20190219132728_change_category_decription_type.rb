# frozen_string_literal: true

class ChangeCategoryDecriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :description, :text
  end
end
