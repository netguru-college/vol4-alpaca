class Event < ApplicationRecord
  validates :name,
            :description,
            presence: true

  has_many :alpacas, through: :alpaca_events
  has_many :alpaca_events
  belongs_to :category
end
