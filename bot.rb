require_relative "bot_functions"
require "discordrb"


bot = Discordrb::Bot.new token: "lmao"

#servername,karma_amount,message,channelfeatured

bot.message() do |event|
  write_cache(event.message.id)
  event.message.create_reaction("👍")
end

bot.message(starts_with: "??channelfeatured") do |event|
  settings(event.server.name,nil,nil,event.message.content.split(" ")[0].to_i)
end

bot.message(starts_with: "??karmaamount") do |event|
  print event.message.content.split(" ")[1].to_i
end

bot.message(starts_with: "??featuredmessage") do |event|
  # settings(event.message.content.split(" ")[1]

end

bot.message()

bot.reaction_add(emoji: "👍") do |event|
  #event.user.username
  message = feature_announcments_message(event.message.content,526029094564003841,5,event.user.username)
  bot.send_message(526029094564003841,message)
end


bot.run
