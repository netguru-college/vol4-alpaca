class SetDefaultAlpacaPriceTo0 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :alpacas, :price, 0
  end
end
