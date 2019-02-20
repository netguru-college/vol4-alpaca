# frozen_string_literal: true
class AlpacasController < ApplicationController
  before_action :find_alpaca, only: %i[show update]

  def index
    ownerships = Ownership.where(owner_to: nil, user_id: current_user)
    @alpacas = Alpaca.where(id: ownerships.map{|o|o.alpaca_id}, for_sale: false)
  end

  def new;end

  def show;end

  def market_place
    @alpacas = Alpaca.where(for_sale: true)
  end

  def update
    if !@alpaca.for_sale
      @alpaca.update_attributes(for_sale: true)
      if @alpaca.update_attributes(alpaca_params)
        redirect_to alpacas_path
      else
        redirect_to alpaca_path(@alpaca)
      end
    else
      @alpaca.update_attributes(for_sale: false)
      redirect_to market_place_path
    end
  end


  private

  def alpaca_params
    params.require(:alpaca).permit(:for_sale, :price)
  end
  def find_alpaca
    @alpaca = Alpaca.find(params[:id])
  end
end
