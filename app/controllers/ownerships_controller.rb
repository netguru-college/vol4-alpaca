# frozen_string_literal: true

class OwnershipsController < ApplicationController
  def change_owner
    @alpaca = Alpaca.find(params[:id])
    @alpaca.ownerships.last.update_attributes(owner_to: DateTime.now)
    @ownership = Ownership.create(user_id: current_user.id, alpaca_id: @alpaca.id)
    @alpaca.update_attributes(for_sale: false)
    redirect_to market_place_path
  end
end

def ownersh_params
  params.require(:ownership).permit(:owner_to, :owner_from)
end
