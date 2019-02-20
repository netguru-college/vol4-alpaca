class AddPurchaseDateToOwnerships < ActiveRecord::Migration[5.2]
  def change
    add_column :ownerships, :owner_from, :datetime
  end
end
