# frozen_string_literal: true

require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info 'Seeds crating started'
@i = 1
5.times do
  user = User.new(
    email: "user#{@i}@mail.com",
    password: "123qwe",
    name: Faker::Internet.username(5..8)
  )
  @i += 1
  user.save!
end

Rails.logger.info 'Seeds crating finished'
