class Category < ApplicationRecord
  has_many :category_skills
  has_many :skills, :through



end
