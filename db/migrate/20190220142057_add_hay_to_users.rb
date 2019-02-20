class AddHayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hay, :integer
  end
end
