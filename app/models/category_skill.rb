class CategorySkill < ApplicationRecord
  belongs_to :category
  belongs_to :skill
end
