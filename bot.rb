require_relative "bot_functions"
require "discordrb"


bot = Discordrb::Bot.new token: "NTI0MDI0MDAzNjIzMzg3MTU3.Dv5Qeg.89IleoCK0ypcl5dCisax80RCa50"


bot.message() do |event|
  write_cache(event.message.id)
  event.message.create_reaction("👍")
end

bot.reaction_add(emoji: "👍") do |event|
  #event.user.username
  message = feature_announcments_message(event.message.content,526029094564003841,5,event.user.username)
  bot.send_message(526029094564003841,message)
end


bot.run
