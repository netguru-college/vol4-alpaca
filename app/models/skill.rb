# frozen_string_literal: true

class Skill < ApplicationRecord
  validates :name,
            :description,
            uniqueness: { case_sensitive: false },
            presence: true

  has_many :alpaca_skills
  has_many :alpacas, through: :alpaca_skills
end
