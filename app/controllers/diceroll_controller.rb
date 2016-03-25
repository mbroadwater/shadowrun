class DicerollController < ApplicationController
  def show
    # if check_request_is_valid
    if check_request_is_valid
      roll_dice(params["text"])

      render :json => {
        "response_type": "in_channel",
        "text": ""}
    end
  end

  def check_request_is_valid
    command_token = "LbtuTe82Wy1ssjYTIasvCrsW"
    rules_followed = true

    if params['token'] != command_token
      rules_followed = false
    end

    if params['command'] != "/roll"
      rules_followed = false
    end

    return rules_followed
  end

  def roll_dice(roll_string)
    # logger.debug(roll_string)

    the_dice = split_roll(roll_string)
  end

  def split_roll(roll_string)
    if(roll_string.split("+")[1])
      modifier = "plus"
    elsif (roll_string.split("-")[1])
      modifier = "neg"
    else
      modifier = "none"
    end
  end

end
