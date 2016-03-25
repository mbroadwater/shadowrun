class ShadowrollController < ApplicationController
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

# If the command is not what I expect, leave
    if params['command'] != "/srd"
      logger.debug "Failed in command check."
      rules_followed = false
      return 0
    end

# Don UserId: U0716T668
# Mike UserId: U0705GQTT
# My UserId: U06V1NG1M

    if rules_followed

      render :json =>
      {
        "response_type": "in_channel",
        "text": ""
      }
    end
  end
end
