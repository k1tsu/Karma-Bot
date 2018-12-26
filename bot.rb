
require_relative "karma_system"
require "discordrb"

bot = Discordrb::Bot.new token: "-"

bot.message() do |event|


bot.message(contains: "!karma view") do |event|
  message = karma_message()
  event.respond(message)
end


bot.message(contains: "!karma reset") do |event|
  event.send_temporary_message("Resetting Karma Values...",10)
  userlist = []
  event.server.members.each do |user|
    userlist << user.display_name
  end
  karma_default(userlist)
end

bot.reaction_add(emoji: "👍") do |event|
  plus_karma(event.user.username)
end


bot.run
