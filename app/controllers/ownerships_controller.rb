# frozen_string_literal: true

class OwnershipsController < ApplicationController

  before_action :find_alpaca

  def index
    @ownerships = Ownership.where(alpaca_id: @alpaca.id )
  end

  def change_owner
    if @alpaca.for_sale == true
      @alpaca.ownerships.last.update_attributes(owner_to: DateTime.now)
      @ownership = Ownership.create(user_id: current_user.id, alpaca_id: @alpaca.id)
      @alpaca.update_attributes(for_sale: false)
      redirect_to market_place_path
    else
      flash.now[:danger] = "This Alpaca is not for sale!"
    end
  end
end

private

def ownersh_params
  params.require(:ownership).permit(:owner_to, :owner_from)
end

def find_alpaca
  @alpaca = Alpaca.find(params[:id])
end
