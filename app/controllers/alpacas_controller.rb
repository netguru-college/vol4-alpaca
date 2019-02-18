class AlpacasController < ApplicationController

  def index
    @alpacas = Alpaca.all
  end
  
  def new
  end

  def show
    @alpaca = Alpaca.find(params[:id])
  end
end
