require 'faker'
require './app/services/google_custom_search_api_service'

module AlpacaService
  class << self
      def randomize
        gender = randomize_gender
        name = randomize_name(gender)
        quote = randomize_quote
        picture_url = randomize_picture

        Alpaca.new(name:        name,
                   gender:      gender,
                   quote:       quote,
                   picture_url: picture_url)
      end

      private

      # Coinflip
      def randomize_gender
        [true, false].sample
      end

      def randomize_name(gender)
        # If it's male, give alpaca male first name, otherwise female name
        name = male?(gender) ? Faker::Name.male_first_name : Faker::Name.female_first_name
        # Coinflip - decide, if alpaca should have middle name or not
        name += ' ' + Faker::Name.middle_name if rand.round == 1
        # Always add last name
        name += ' ' + Faker::Name.last_name
      end

      def male?(gender)
        gender == true
      end

      def randomize_quote
        # Choose random number from range 1 to 3
        random = (1..3).to_a.sample
        return Faker::Quote.yoda             if random == 1
        return Faker::Quote.matz             if random == 2
        return Faker::Quote.singular_siegler if random == 3
      end

      def randomize_picture
        response = GoogleCustomSearchApiService::pictures
        if response.nil?
          # If response is nil (HTTP error), return nil, so the model validation won't pass
          return nil
        else
          # Our response is hash. We access its key, named "items", which value is an array of hashes with found links
          items = response['items']
          # Take random element from items array and access "link" key, which contains value of random picture URL
          items.sample['link']
        end
      end
    end
end
