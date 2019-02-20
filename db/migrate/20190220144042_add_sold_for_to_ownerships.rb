class AddSoldForToOwnerships < ActiveRecord::Migration[5.2]
  def change
    add_column :ownerships, :sold_for, :integer
  end
end
