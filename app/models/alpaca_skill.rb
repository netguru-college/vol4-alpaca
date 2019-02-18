class AlpacaSkill < ApplicationRecord
  validates_inclusion_of :level,
                         in: (1..100),
                         presence: true

  belongs_to :alpaca
  belongs_to :skill
end
