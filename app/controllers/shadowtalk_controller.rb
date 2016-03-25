class ShadowtalkController < ApplicationController
  def show

# Dump everything to the log for now so I can see what's getting passed
    logger.debug "user_id: #{params['user_id']}"
    logger.debug "user_name: #{params['user_name']}"

# Token for this slash command for some kind of security
    command_token = "JbwzU8FIkfv6GOXzKsfYsJd5"

# If the token passed isn't what I expect, leave
    if params['token'] != command_token
      logger.debug "Failed in token check."
      rules_followed = false
      return 0
    end

# If the command is not what I expect, leave
    if params['command'] != "/sr"
      logger.debug "Failed in command check."
      rules_followed = false
      return 0
    end

# A switch I'm thinking of using for checking that everything is kosher
    rules_followed = true

# Don UserId: U0716T668
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
      rules_followed = false
    end

    if rules_followed
      now_time = Time.new
      post_time = Time.new(now_time.year+59, now_time.month, now_time.day, now_time.hour-4, now_time.min, now_time.sec)

      render :json =>
      {
        "username": params['user_name'],
        "response_type": "in_channel",
        "text": "\u00AD&gt;&gt;&gt;&gt;&gt;[#{params['text']}]&lt;&lt;&lt;&lt;&lt;\n \u2014 #{toon_name} <#{post_time.strftime("%H:%M:%S / %m-%d-%Y")}>"
        #"text": "\u00AD&gt;&gt;&gt;&gt;&gt;[#{params['text']}]&lt;&lt;&lt;&lt;&lt;\n - #{toon_name} <#{post_time.strftime("%H:%M:%S / %m-%d-%Y")}>"
      }
      # logger.debug reply_text
    end

    # Build and send a simple JSON reply
    # render :json => {"text": reply_text}
    # render :json => {"text": "test"}

  end
end
