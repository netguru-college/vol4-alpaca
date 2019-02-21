class AddPriceToAlpaca < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :price, :integer
  end
end
