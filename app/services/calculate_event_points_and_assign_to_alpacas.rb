class CalculateEventPointsAndAssignToAlpacas
  def initialize(event)
    @event = event
  end

  def call
    points = calculate_points
    points.each do |alpaca_id, points|
      Alpaca.find(alpaca_id).alpaca_events.find_by(event_id: @event.id).update(points: points)
    end
    points
  end

  private

  def calculate_points
    points = {}

    calculate_levels.each do |alpaca_id, level|
      points[alpaca_id] = @event
                          .category
                          .category_skills
                          .first
                          .weight * (roll(1, 20) + level)
    end
    points
  end

  def calculate_levels
    levels = {}

    @event.alpacas.each do |alpaca|
      @event.category.skills.each do |skill|
        levels[alpaca.id] = alpaca.alpaca_skills.find_by(skill_id: skill.id).level
      end
    end

    levels
  end

  def roll(amount = 0, sides = 0)
    # rand(1..0) will return nil btw
    amount.to_i.times.sum { rand(1..sides.to_i) }
  end
end
