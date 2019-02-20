# frozen_string_literal: true

class OwnershipsController < ApplicationController

  before_action :find_alpaca

  def index
    @ownerships = Ownership.where(alpaca_id: @alpaca.id)
  end

  def change_owner
    if @alpaca.for_sale
      if  current_user.hay >= @alpaca.price
        if @alpaca.ownerships.any?
          @seller = User.find(@alpaca.ownerships.last.user_id)
          @alpaca.ownerships.last.update_attributes(owner_to: DateTime.now, sold_for: @alpaca.price)
          @seller.update_attributes(hay: @seller.hay + @alpaca.price)
        end
        current_user.update_attributes(hay: current_user.hay - @alpaca.price)
        @ownership = Ownership.create(user_id: current_user.id, alpaca_id: @alpaca.id)
        @alpaca.update_attributes(for_sale: false)
        flash[:success] = "You bought new Alpaca! :D"
        redirect_to market_place_path
      else
        flash[:danger] = "You don't have enouqh hay!"
        redirect_to alpaca_path(@alpaca)
      end

    else
      flash[:danger] = "This Alpaca is not for sale!"
      redirect_to market_place_path
    end
  end
end

private

def ownerships_params
  params.require(:ownership).permit(:owner_to, :sold_for)
end

def find_alpaca
  @alpaca = Alpaca.find(params[:id])
end
