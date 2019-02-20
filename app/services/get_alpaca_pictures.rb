# frozen_string_literal: true

require 'open-uri'

class GetAlpacaPictures
  API_KEY = Rails.application.config.google_custom_search_api_key
  ENGINE_ID = Rails.application.config.google_custom_search_engine_id
  URL = 'https://www.googleapis.com/customsearch/v1?key=' + API_KEY + '&cx=' + ENGINE_ID +
        '&searchType=image&q=alpaca&imgSize=medium&start='

  def call
    address_with_random_index = URL + (1..90).to_a.sample.to_s
    begin
      open(address_with_random_index).read
    rescue OpenURI::HTTPError => error
      return nil
    end
  end
end
