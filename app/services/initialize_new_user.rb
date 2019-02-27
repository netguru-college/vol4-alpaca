# frozen_string_literal: true

class InitializeNewUser
  def initialize(current_user)
    @user = current_user
  end

  def call
    alpaca = CreateRandomAlpaca.new.call
    alpaca.save
    InitializeNewAlpacaSkills.new(alpaca).call
    Ownership.create(alpaca_id: alpaca.id, user_id: @user.id)
    @user.update(hay: 200)
  end
end
