require 'net/http'

class ShadowtalkController < ApplicationController
  #skip_before_filter  :verify_authenticity_token
  before_action :authenticate!

  def reply

    req = Net::HTTP::Post.new(params[:response_url], initheader = {'Content-Type' => 'application/json'})
    req.body = {
          response_type: "in_channel",
          text: create_response_text
        }.to_json
    response = Net::HTTP.new('hooks.slack.com').start {|http| http.request(req)}
    render json: {
      "text": "Response #{response.message}:#{response.body}"
    }, status: response.code
  end

  private

  def authenticate!
    unless request_is_valid?
      render json: {
        "response_type": "ephemeral",
        "text": "um?"
      }, status: 401
    end
  end

  def request_is_valid?
    token_is_valid? && command_is_valid? && text_is_valid?
  end

  def token_is_valid?
    command_token = "JbwzU8FIkfv6GOXzKsfYsJd5"
    params[:token] == command_token
  end

  def text_is_valid?
    !params[:text].empty?
  end

  def command_is_valid?
    params[:command] == "/sr_old"
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

#  def reply_params
#    params.permit(:user_name, :token, :text, :command, :response_url)
#  end

end
