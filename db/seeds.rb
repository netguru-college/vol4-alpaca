# frozen_string_literal: true

require 'faker'

def assign_random_skills(alpaca)
  Skill.all.each do |skill|
    alpaca.alpaca_skills.create(skill_id: skill.id, level: (1..100).to_a.sample)
  end
end

Rails.logger = Logger.new(STDOUT)
Rails.logger.info 'Seeds crating started'

skills = {
  'Strength': 'Describes physical strength of your alpaca',
  'Wisdom':   'Describes intelligence and mentall skills of your alpaca',
  'Speed':    'Describes quickness and agility of your alpaca'
}

skills.each do |name, description|
  Skill.create(name: name.to_s, description: description)
end
Rails.logger.info 'Strength, Wisdom and Speed skills have been created.'

categories = [
  {
    name: 'Weightlifting',
    description: 'Only most powerful Alpacas can compete',
    picture_url: 'https://images-na.ssl-images-amazon.com/images/I/61edgCieFJL._SL1500_.jpg'
  },
  {
    name: 'Sprint',
    description: 'You have to be quick!!',
    picture_url: 'http://3.bp.blogspot.com/-gC0NsOJjcvU/T_e4OtYdSLI/AAAAAAAAB2M/wflXgT1IGfw/s1600/alpaca_sprint.jpg'
  },
  {
    name: 'Chess',
    description: "You are a smart one, aren't you?",
    picture_url: 'https://cdn.drawception.com/images/panels/2012/12-28/qwRWdt5aN8-6.png'
  }
]

categories.each do |category|
  Category.create(name: category[:name], description: category[:description], picture_url: category[:picture_url])
end
Rails.logger.info 'Weightlifting, Sprint and Chess categories have been created.'

Category.all.each do |category|
  Skill.all.each do |skill|
    CategorySkill.create(category_id: category.id, skill_id: skill.id, weight: 10)
  end
end
Rails.logger.info 'CategorySkill created'

@i = 1
5.times do
  user = User.new(
    email: "user#{@i}@mail.com",
    password: '123qwe',
    name: Faker::Internet.username(5..8),
    hay: 200
  )
  user.save
  alpaca = CreateRandomAlpaca.new.call
  alpaca.save
  assign_random_skills(alpaca)
  ownership = Ownership.new
  ownership.alpaca_id = alpaca.id
  ownership.user_id = user.id
  ownership.save
  @i += 1
end
Rails.logger.info '5 users created, where emails are user1@mail.com to user5@mail.com, password: 123qwe.' \
                  ' Every user has one Alpaca and randomly distributed skill levels.'

20.times do
  alpaca = CreateRandomAlpaca.new.call
  alpaca.for_sale = true
  alpaca.price = (1..50).to_a.sample
  alpaca.save
  assign_random_skills(alpaca)
end
Rails.logger.info '20 Alpacas put on Market.'
