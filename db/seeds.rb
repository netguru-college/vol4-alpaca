# frozen_string_literal: true

require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info 'Seeds crating started'

3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    name: Faker::Internet.username(5..8)
  )
  user.save!
end



Rails.logger.info 'Seeds crating finished'
