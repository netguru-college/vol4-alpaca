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

  def get_alpaca_skills(alpaca); end
end
