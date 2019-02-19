class AddForSaleToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :for_sale, :boolean
  end
end
