# frozen_string_literal: true

class OwnershipsController < ApplicationController

  before_action :find_alpaca

  def index
    @ownerships = Ownership.where(alpaca_id: @alpaca.id)
  end

  def change_owner
    if @alpaca.for_sale
      if @alpaca.ownerships.any?
        @alpaca.ownerships.last.update_attributes(owner_to: DateTime.now)
      end
      @ownership = Ownership.create(user_id: current_user.id, alpaca_id: @alpaca.id)
      @alpaca.toggle(:for_sale)
      redirect_to market_place_path
    else
      flash.now[:danger] = "This Alpaca is not for sale!"
    end
  end
end

private

def ownerships_params
  params.require(:ownership).permit(:owner_to)
end

def find_alpaca
  @alpaca = Alpaca.find(params[:id])
end
