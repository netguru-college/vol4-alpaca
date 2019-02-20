# frozen_string_literal: true

class Alpaca < ApplicationRecord
  validates :name,
            :quote,
            :picture_url,
            presence: true

  has_many :alpaca_skills
  has_many :skills, through: :alpaca_skills

  has_many :ownerships
  has_many :users, through: :ownerships

  def current_owner
    ownerships.where(owner_to: nil).pluck(:user_id)
  end
end
