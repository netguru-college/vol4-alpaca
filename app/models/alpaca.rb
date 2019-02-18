require 'faker'

class Alpaca < ApplicationRecord
  include ApiHelper

  before_validation :randomize_gender,
                    :randomize_name,
                    :randomize_quote,
                    :randomize_picture,
                    on: :create

  validates :name,
            :quote,
            :picture_url, presence: true

  has_many :alpaca_skills
  has_many :skills, through: :alpaca_skills

  has_many :ownerships
  has_many :users, through: :ownerships


  private

  # Coinflip - choose a number between 0 and 1 and round it to the nearest integer.
  # Return 0 or 1, where 0 is woman, 1 is man.
  def randomize_gender
    self.gender = rand.round
  end

  def randomize_name
    # If it's male, give alpaca male first name, otherwise female name
    male? ? self.name = Faker::Name.male_first_name : self.name = Faker::Name.female_first_name
    # Coinflip - decide, if alpaca should have middle name or not
    self.name += ' ' + Faker::Name.middle_name if rand.round == 1
    # Always add last name
    self.name += ' ' + Faker::Name.last_name
  end

  def male?
    gender == 1
  end

  def randomize_quote
    # Choose random number from range 1 to 3
    random = (1..3).to_a.sample
    self.quote = Faker::Quote.yoda             if random == 1
    self.quote = Faker::Quote.matz             if random == 2
    self.quote = Faker::Quote.singular_siegler if random == 3
  end

  def randomize_picture
    response = pictures

    if response.nil?
      # If response is nil (HTTP error), set picture_url to nil, so the model validation won't pass
      self.picture_url = nil
    else
      # Our response is hash. We access its key, named "items", which value is an array of hashes with found links
      items = response['items']
      # Take random element from items array and access "link" key, which contains value of random picture URL
      self.picture_url = items.sample['link']
    end
  end

  def pictures
    # Get API key and engine ID from Rails config, required to make request to Google Custom Search API
    api_key = Rails.application.config.google_custom_search_api_key
    engine_id = Rails.application.config.google_custom_search_engine_id
    # Pick random number from 1 to 90 - define it as a starting element
    starting_index = (1..90).to_a.sample
    # API requests will be sent on the URL below
    address = 'https://www.googleapis.com/customsearch/v1?key=' +
              api_key + '&cx=' + engine_id +
              '&searchType=image&q=alpaca&imgSize=medium&start=' +
              starting_index.to_s

    # Method from ApiHelper, used to get JSON response from API
    fetch_response(address)
  end
end
