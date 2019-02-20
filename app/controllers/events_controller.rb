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

      calculate_winner
      redirect_to @event
    else
      render 'update'
    end
  end

  private

  def calculate_winner
    points = {}
    p get_levels
    get_levels.each do |alpaca_id, level|
      points[alpaca_id] = @event
                         .category
                         .category_skills
                         .first
                         .weight * roll(1, 6) * level
    end
    points.max_by{ |alpaca_id, points| points }
  end

  def roll(amount = 0, sides = 0)
    # rand(1..0) will return nil btw
    amount.to_i.times.sum { |t| rand(1..sides.to_i) }
  end

  def get_levels
    levels = {}
    @event.alpacas.each do |alpaca|
      @event.category.skills.each do |skill|
        levels[alpaca.id] = AlpacaSkill.where(
                                  alpaca_id: alpaca.id,
                                  skill_id: skill.id
                                )
                                .first
                                .level
      end
    end
    return levels
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id)
  end
end
