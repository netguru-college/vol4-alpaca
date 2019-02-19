# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name,
            :description,
            presence: true
  has_many :events
  has_many :category_skills
  has_many :skills, through: :category_skills
end
