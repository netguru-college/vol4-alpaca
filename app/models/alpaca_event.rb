# frozen_string_literal: true

class AlpacaEvent < ApplicationRecord
  belongs_to :alpaca
  belongs_to :event
end
