class AlpacaSkill < ApplicationRecord
  validates :level, in: 1..100

  belongs_to :alpaca
  belongs_to :skill
end
