class SetOwnerFromDefaultDate < ActiveRecord::Migration[5.2]
  def change
    change_column_default :ownerships, :owner_from, DateTime.now
  end
end
