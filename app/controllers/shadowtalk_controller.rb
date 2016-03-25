class ShadowtalkController < ApplicationController
  def show
    if check_request_is_valid
      formated_response = create_response_text

      render :json =>
      {
        "response_type": "in_channel",
        "text": formated_response
      }
    end
  end

  def check_request_is_valid
    command_token = "JbwzU8FIkfv6GOXzKsfYsJd5"
    rules_followed = true

    if params['token'] != command_token
      logger.debug "Failed in token check."
      rules_followed = false
    end

    if params['command'] != "/sr"
      logger.debug "Failed in command check."
      rules_followed = false
    end

    return rules_followed
  end

  def assign_toon_name

    # Get the proper toon name. Need to switch this to slack ID values
    # but I don't know how to get those without using the API
    case params['user_name']
    when "mikeb"
      toon_name = "Spooky"
    when "seanscian"
      toon_name = "Ella"
    when "thursdaze"
      toon_name = "Shugga Bear"
    end

    return toon_name
  end

  def create_response_text
    open_text = "\u00AD&gt;&gt;&gt;&gt;&gt;["
    close_text = "]&lt;&lt;&lt;&lt;&lt;"

    toon_name = assign_toon_name

    now_time = Time.new
    post_time = Time.new(now_time.year+59, now_time.month, now_time.day, now_time.hour, now_time.min, now_time.sec).strftime("%H:%M:%S / %m-%d-%Y")

    formated_response = "#{open_text}#{params['text']}#{close_text}\n \u2014 #{toon_name} <#{post_time}>"

    return formated_response
  end

end
