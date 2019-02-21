# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.where.not(user_id: current_user.id)
                   .joins(:alpacas)
                   .group('events.id')
                   .having('count(alpaca_id) < 2')
  end

  def show
    @event = Event.find(params[:id])
    @alpacas = @event.alpacas
    ownerships = Ownership.where(owner_to: nil, user_id: current_user.id)
    @alpacas_to_choose = Alpaca.where(id: ownerships.map{|o|o.alpaca_id}, for_sale: false)
    @winner = @event.alpaca_events.find_by(winner: true)&.alpaca
  end

  def new
    @event = Event.new
    ownerships = Ownership.where(owner_to: nil, user_id: current_user.id)
    @alpacas = Alpaca.where(id: ownerships.map{|o|o.alpaca_id}, for_sale: false)
  end

  def create
    @event = current_user.events.new(event_params)
    @alpaca = current_user.alpacas.find(params[:event][:alpacas])

    if @event.save
      @event.alpacas << @alpaca
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @alpaca = Alpaca.find(params[:event][:alpacas])
    @event = Event.find(params[:id])

    if @event.alpacas << @alpaca
      @points = CalculateEventPointsAndAssignToAlpacas.new(@event).call
      @event.alpaca_events.find_by(event_id: @event.id, alpaca_id: @points.max_by{ |_alpaca_id, points| points })
            .update(winner: true)

      redirect_to @event
    else
      render 'update'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :category_id)
  end
end
