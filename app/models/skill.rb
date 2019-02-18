class Skill < ApplicationRecord
  validates :name,
            :description,
            uniqueness: { case_sensitive: false }

  has_many :alpaca_skills
  has_many :alpacas, through: :alpaca_skills
end
