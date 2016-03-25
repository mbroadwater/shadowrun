class ShadowtalkController < ApplicationController
  def show

# Token for this slash command for some kind of security
    command_token = "JbwzU8FIkfv6GOXzKsfYsJd5"

# A switch I'm thinking of using for checking that everything is kosher
    rules_followed = true


# If the token passed isn't what I expect, leave
    if params['token'] != command_token
      logger.debug "Failed in token check."
      rules_followed = false
      return 0
    end

# If the channel room is not a specific one, leave
#      if params['channel_name'] != "shadowrunrp"
#        logger.debug "Failed in command check."
#        rules_followed = false
#        return 0
#      end


# If the command is not what I expect, leave
    if params['command'] != "/sr"
      logger.debug "Failed in command check."
      rules_followed = false
      return 0
    end


# Don UserId: U0716T668
# Mike UserId: U0705GQTT
# My UserId: U06V1NG1M

# Get the proper toon name. Need to switch this to slack ID values
# but I don't know how to get those without using the API
    case params['user_name']
    when "mikeb"
      toon_name = "Spooky"
    when "seanscian"
      toon_name = "Ella"
    when "thursdaze"
      toon_name = "Shugga Bear"
    else
      logger.debug "Failed in user_name check"
      render :json =>
      {
        "response_type": "ephemeral",
        "text": "You are not an allowed poster. Please speak to your admin."
      }
      rules_followed = false
    end

    if rules_followed
      now_time = Time.new
      post_time = Time.new(now_time.year+59, now_time.month, now_time.day, now_time.hour, now_time.min, now_time.sec)

      render :json =>
      {
        "response_type": "in_channel",
        "text": "\u00AD&gt;&gt;&gt;&gt;&gt;[#{params['text']}]&lt;&lt;&lt;&lt;&lt;\n \u2014 #{toon_name} <#{post_time.strftime("%H:%M:%S / %m-%d-%Y")}>"
      }
    end

    # Build and send a simple JSON reply
    # render :json => {"text": reply_text}
    # render :json => {"text": "test"}

  end
end
