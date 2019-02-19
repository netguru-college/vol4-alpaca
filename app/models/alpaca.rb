class Alpaca < ApplicationRecord
  validates :name,
            :quote,
            :picture_url, presence: true

  has_many :alpaca_skills
  has_many :skills, through: :alpaca_skills

  has_many :ownerships
  has_many :users, through: :ownerships

  def last_owner
    if ownerships.last != nil
      ownerships.last.user_id
    end
  end


end
