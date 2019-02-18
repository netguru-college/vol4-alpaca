class AddGenderToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :gender, :boolean
  end
end
