class DicerollController < ApplicationController
  def show

      # if check_request_is_valid
      if true
        render :json =>
        {
          "response_type": "in_channel",
          "text": ""
        }
      end
    end

    def check_request_is_valid
      command_token = ""
      rules_followed = true

      if params['token'] != command_token
        rules_followed = false
      end

      if params['command'] != "/roll"
        rules_followed = false
      end

      return rules_followed
    end

  end
