# frozen_string_literal: true

class CreateRandomAlpaca
  def call
    Alpaca.new(for_sale: false).tap do |alpaca|
      set_random_gender(alpaca)
      set_random_name(alpaca)
      set_random_quote(alpaca)
      set_random_picture(alpaca)
    end
  end

  private

  def set_random_gender(alpaca)
    alpaca.gender = [true, false].sample
  end

  def set_random_name(alpaca)
    alpaca.name = male?(alpaca) ? Faker::Name.male_first_name : Faker::Name.female_first_name
    alpaca.name += ' ' + Faker::Name.middle_name if rand.round == 1
    alpaca.name += ' ' + Faker::Name.last_name
  end

  def male?(alpaca)
    alpaca.gender == true
  end

  def set_random_quote(alpaca)
    random_author = %i[yoda matz singular_siegler].sample
    alpaca.quote = Faker::Quote.public_send(random_author)
  end

  def set_random_picture(alpaca)
    response = JSON.parse(GetAlpacaPictures.new.call)
    if response.nil?
      # If response is nil (HTTP error), return nil, so the model validation won't pass
      return nil
    else
      items = response['items']
      alpaca.picture_url = items.sample['link']
    end
 end
end
