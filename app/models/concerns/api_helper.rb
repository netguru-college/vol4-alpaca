# frozen_string_literal: true

# This module is responsible for making external API calls
# It should be considered to add HTTParty gem, as Ruby's HTTP library is
# hard to use and obsolete.
require 'net/https'
require 'uri'

module ApiHelper
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
