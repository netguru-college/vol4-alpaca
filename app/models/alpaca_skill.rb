# frozen_string_literal: true

class AlpacaSkill < ApplicationRecord
  validates_inclusion_of  :level,
                          in: (1..100)
  validates_uniqueness_of :alpaca_id,
                          scope: :skill_id

  belongs_to :alpaca
  belongs_to :skill
end
