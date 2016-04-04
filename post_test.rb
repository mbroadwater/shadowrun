require 'net/http'

require 'rubygems'
require 'json'

SLACK_WEBHOOK_URI = "https://hooks.slack.com/services/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"

def post
  payload = {
    text: "My query",
    channel: "@mikeb"}

  uri = URI.parse(SLACK_WEBHOOK_URI)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
  request.body = payload.to_json

  response = http.request(request)

  puts "Response #{response.code} #{response.message} #{response.body}"
end

thepost = post
puts thepost
