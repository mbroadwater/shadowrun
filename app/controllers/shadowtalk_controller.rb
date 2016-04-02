require 'net/http'


class ShadowtalkController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :authenticate!

  def reply
    payload = {
      response_type: "in_channel",
      text: create_response_text
    }

    #uri = URI.parse("https://hooks.slack.com/services/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")
    uri = URI.parse(reply_params[:response_url])

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request.body = payload.to_json

    response = http.request(request)

    render plain: {
      "message": response.message,
      "body": response.body,
      "code": response.code
    }, status: response.code
  end

  private

  def authenticate!
    unless request_is_valid?
      render json: {
        "response_type": "ephemeral",
        "text": "There was an error."
      }, status: 401
    end
  end

  def request_is_valid?
    token_is_valid? && command_is_valid? && text_is_valid?
  end

  def token_is_valid?
    command_token = "JbwzU8FIkfv6GOXzKsfYsJd5"
    reply_params[:token] == command_token
  end

  def text_is_valid?
    !reply_params[:text].empty?
  end

  def command_is_valid?
    reply_params[:command] == "/sr_old"
  end

  def assign_toon_name
    user_name = params[:user_name]

    toon_names = {
      "mikeb" => "Spooky",
      "seanscian" => "Ella",
      "thursdaze" => "Shugga Bear"
    }

    return toon_names[user_name]
  end

  def create_response_text
    open_text = "\u00AD&gt;&gt;&gt;&gt;&gt;["
    close_text = "]&lt;&lt;&lt;&lt;&lt;"

    toon_name_text = assign_toon_name

    post_time = Time.now + 59.years + Time.zone_offset("CST")
    post_time_text = post_time.strftime("%H:%M:%S / %m-%d-%Y")

    comment_text = params[:text]

    "#{open_text}#{comment_text}#{close_text}\n \u2014 #{toon_name_text} <#{post_time_text}>"
  end

  def reply_params
    params.permit(:user_name, :token, :text, :command, :response_url)
  end

end
