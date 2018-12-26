test = ["<Member", "user=<User", "username=kitsu", "id=196412773062803460", "discriminator=8495>", "server=<Server", "name=Bot", "Server", "id=500260125538385920", "large=false", "region=", "owner=#<Discordrb::User:0x000055880074b7c8>", "afk_channel_id=", "system_channel_id=500260125538385922", "afk_timeout=300>", "joined_at=2018-10-12", "10:55:08", "+0000", "roles=[<Role", "name=Skyrim", "permissions=#<Discordrb::Permissions:0x00005588007585e0", "@writer=<RoleWriter", "role=#<Discordrb::Role:0x0000558800758658>", "token=...>,", "@bits=104324161,", "@create_instant_invite=true,", "@kick_members=false,", "@ban_members=false,", "@administrator=false,", "@manage_channels=false,", "@manage_server=false,", "@add_reactions=true,", "@view_audit_log=false,", "@priority_speaker=false,", "@read_messages=true,", "@send_messages=true,", "@send_tts_messages=true,", "@manage_messages=false,", "@embed_links=true,", "@attach_files=true,", "@read_message_history=true,", "@mention_everyone=true,", "@use_external_emoji=true,", "@connect=true,", "@speak=true,", "@mute_members=false,", "@deafen_members=false,", "@move_members=false,", "@use_voice_activity=true,", "@change_nickname=true,", "@manage_nicknames=false,", "@manage_roles=false,", "@manage_webhooks=false,", "@manage_emojis=false>", "hoist=false", "colour=#<Discordrb::ColourRGB:0x000055880074b868", "@combined=3447003,", "@red=52,", "@green=152,", "@blue=219>", "server=<Server", "name=Bot", "Server", "id=500260125538385920", "large=false", "region=", "owner=#<Discordrb::User:0x000055880074b7c8>", "afk_channel_id=", "system_channel_id=500260125538385922", "afk_timeout=300>>]", "voice_channel=nil", "mute=", "deaf=", "self_mute=", "self_deaf=>"]

LINE_BREAK = "                                                                                                                                                                                                                                                                                                                                                                                                                           "



def karma_default(user_array)
  default_array = []
  user_array.each do |user|
    default = "#{user}:0"
    default_array <<  default
  end
  File.open("karma_user.txt","w") {|f| f.puts default_array.join("\n")}
end

def karma(username)
  lines = array_chomp(File.readlines("karma_user.txt"))
  lines.each do |user|
    user_ = user.split(":")[0]
    karma = user.split(":")[1]
    index = lines.index(user)
    if user_ == username
      return user_,karma.to_i,index
    end
  end
end

def change_karma(username,new_karma)
  attributes = get_karma(username)
  lines = File.readlines(KARMA_DIR)
  lines[attributes[2]] = "#{username}:#{new_karma}\n"
  File.open(KARMA_DIR,'w') {|file| file.write(lines.join)}
end

def plus_karma(username)
  attributes = get_karma(username)
  change_karma(username,attributes[1] + 1)
end


def karma_update(user_array)
end

def karma_array()
  display = File.readlines("karma_user.txt")
  return display
end


def karma_display_sort()
  karma = {}
  display = []
  array = karma_array()
  array.each do |user|
    split = user.split(":")
    split[1] = split[1].to_i
    karma[split[0]] = split[1]
  end
  karma = karma.sort_by {|_key, value| value}.to_h
  karma.each_pair do |pair|
    display << "#{pair[0]}: #{pair[1]} Karma"
  end
  display = display.take(9)
  display = display.reverse
  return display
end


def karma_message()
  display = karma_display_sort()
  message = "```\n#{display.join("\n")}\n```"
  return message
end
