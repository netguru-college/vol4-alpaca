# frozen_string_literal: true

require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info 'Seeds crating started'
@i = 1
5.times do
  user = User.new(
    email: "user#{@i}@mail.com",
    password: "123qwe",
    name: Faker::Internet.username(5..8),
    hay: 200
  )
  user.save
  alpaca = CreateRandomAlpaca.new.call
  alpaca.save
  ownership = Ownership.new
  ownership.alpaca_id = alpaca.id
  ownership.user_id = user.id
  ownership.save
  @i += 1

end

Rails.logger.info '5 users created, where emails are user1@mail.com to user5@mail.com, password: 123qwe. Every user has one Alpaca.'

20.times do

  alpaca = CreateRandomAlpaca.new.call
  alpaca.for_sale = true
  alpaca.save

end

Rails.logger.info '20 Alpacas put on Market.'
