class OwnershipsController < ApplicationController

  def change_owner
    @alpaca = Alpaca.find(params[:id])
    @ownership = Ownership.create(user_id: current_user.id, alpaca_id: @alpaca.id)
    @alpaca.update_attributes(for_sale: false)
    redirect_to market_place_path
  end

end
