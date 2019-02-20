class AddBusyColumnToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :busy, :boolean, null: false, default: false
  end
end
