# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @user = current_user
    @events = Event.joins(:alpacas)
                   .group('events.id')
                   .having('count(alpaca_id) < 2')
  end

  def show
    @event = Event.find(params[:id])
    @alpacas = @event.alpacas
    @user = current_user
  end

  def new
    @event = Event.new
    @alpacas = current_user.alpacas
  end

  def create
    @event = Event.new(event_params)
    @alpaca = current_user
              .alpacas
              .find(params[:event][:alpacas])

    if @event.save
      AlpacaEvent.new(
                      alpaca_id: @alpaca.id,
                      event_id: @event.id
                     )
                     .save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @alpaca = Alpaca.find(params[:event][:alpacas])
    @event = Event.find(params[:id])

    if AlpacaEvent.new(
                        alpaca_id: @alpaca.id,
                        event_id: @event.id
                      )
                      .save

      AlpacaEvent.where(
                          event_id:   @event.id,
                          alpaca_id:  CalculateEventWinner
                                      .new(@event)
                                      .call
                        )
                 #.update(
                  #        winner:     true
                  #      )

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
