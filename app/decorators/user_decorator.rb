class UserDecorator < Draper::Decorator
  delegate_all

  def fortune
    object.name ? "#{object.name.titleize}'s fortune: #{object.hay}" :  "User's fortune: #{object.hay}"
  end

end
