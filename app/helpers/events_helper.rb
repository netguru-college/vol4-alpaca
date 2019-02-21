# frozen_string_literal: true

module EventsHelper
  def host?(user, event)
    event.user == user
  end

  def button_visible?(user, event, winner)
    !host?(user, event) && !winner
  end

  def convert_gender(alpaca)
    return 'Male'   if     alpaca.gender
    return 'Female' unless alpaca.gender
  end

  def get_alpaca_points(alpaca, event)
    alpaca.alpaca_events.find_by(event_id: event.id)&.points
  end

  def get_alpaca_skills(alpaca)
    skills = {}

    alpaca.alpaca_skills.each do |alpaca_skill|
      skill = Skill.find(alpaca_skill.skill_id)
      skills[skill.name] = alpaca_skill.level
    end

    skills
  end
end
