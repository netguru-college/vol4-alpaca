class AddOwnerToOwnerships < ActiveRecord::Migration[5.2]
  def change
    add_column :ownerships, :owner_to, :datetime
  end
end
