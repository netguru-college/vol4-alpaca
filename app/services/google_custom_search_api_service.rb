# frozen_string_literal: true

# This module is responsible for making external API calls
# It should be considered to add HTTParty gem, as Ruby's HTTP library is
# hard to use and obsolete.
require 'net/https'
require 'uri'

module GoogleCustomSearchApiService
  class << self
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
      # Method from GoogleCustomSearchApiService, used to get JSON response from API
      fetch_response(address)
    end

    private

    def fetch_response(address)
      uri = URI.parse(address)
      http = Net::HTTP.new(uri.host, uri.port)
      # Use HTTPS
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      # Create new GET request
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      if response.code == '200'
        return JSON.parse(response.body)
      else
        # Return nil, if response returns error code. Exception handling?
        return nil
      end
    end
  end
end
