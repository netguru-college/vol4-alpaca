class AlpacasController < ApplicationController

  def index
    @alpacas = Alpaca.where(for_sale: false) || Alpaca.where(for_sale: nil)
  end

  def new
  end

  def show
    @alpaca = Alpaca.find(params[:id])

  end

  def market_place
    @alpacas = Alpaca.where(for_sale: true)
  end

  def sell
    @alpaca = Alpaca.find(params[:id])
    @alpaca.update_attributes(for_sale: true)
    redirect_to market_place_path
  end

  def buy

  end

  private

  def alpaca_params
      params.require(:alpaca).permit(:for_sale)
  end


end
