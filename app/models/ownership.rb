# frozen_string_literal: true

class Ownership < ApplicationRecord
  belongs_to :alpaca
  belongs_to :user
end
