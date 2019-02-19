class CategorySkill < ApplicationRecord

  validates :weight, numericality: { greater_than: 0 }
  belongs_to :category
  belongs_to :skill
end
