class AddWinnerColumnToAlpacaEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :alpaca_events, :winner, :boolean, null: false, default: false
  end
end
