class CalculateEventWinner
  def initialize(event)
    @event = event
  end

  def call
    calculate_winner.first
  end

  private

  def calculate_winner
    points = {}

    get_levels.each do |alpaca_id, level|
      points[alpaca_id] = @event
                         .category
                         .category_skills
                         .first
                         .weight * (roll(1, 20) + level)
    end
    points.max_by{ |alpaca_id, points| points }
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

  def roll(amount = 0, sides = 0)
    # rand(1..0) will return nil btw
    amount.to_i.times.sum { |t| rand(1..sides.to_i) }
  end
end
