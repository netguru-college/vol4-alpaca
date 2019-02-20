class ChangeUrlsDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avatar_url, :text
    change_column :alpacas, :picture_url, :text
  end
end
