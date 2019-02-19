class Skill < ApplicationRecord
  validates :name,
            :description,
            uniqueness: { case_sensitive: false },
            presence: true

  has_many :alpaca_skills
  has_many :alpacas, through: :alpaca_skills


  has_many :category_skills
  has_many :categories, through: :category_skills






end
