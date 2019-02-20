class AddColumnPointsToAlpacaEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :alpaca_events, :points, :integer, null: false, default: 0
  end
end
