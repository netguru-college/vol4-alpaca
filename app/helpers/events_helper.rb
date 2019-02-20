# frozen_string_literal: true

module EventsHelper
  def host?(user, event)
    event.user == user
  end

  def button_visible?(user, event, winner)
    !host?(user, event) && !winner
  end
end
