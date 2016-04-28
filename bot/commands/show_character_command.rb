require 'rest-client'

class ShowCharacterCommand < SlackRubyBot::Commands::Base
  options = {
    full: "full",
    attributes: "attributes",
    skills: "skills",
    defenses: "defenses",
  }

  match /^show (?<option>\w*) (?<character>\w*\s?\w*)/ do |client, data, match|
    response = RestClient.get("https://shadowguild.herokuapp.com/api/v1/characters/?name=#{match[:character]}")
    # response = RestClient.get("localhost:3000/api/v1/characters/?name=#{match[:character]}")
    response_json = JSON.parse(response)

    char_hash = {
      name: response_json.dig("character", "name"),
      user_id: response_json.dig("character", "user_id"),
      attributes: response_json.dig("character", "char_attributes"),
      skills: response_json.dig("character", "active_skills"),
      defenses: response_json.dig("character", "defenses")
    }

    reply_text = "*Name*: #{char_hash[:name]}\n\n"

    if match[:option].downcase == options[:full] || match[:option].downcase == options[:attributes]
      reply_text += "*Attributes*:\n"

      char_hash[:attributes].each do |a|
        if a.dig("value_modified").nil? || a.dig("value_base") == a.dig("value_modified")
          reply_text += "\t*#{a.dig("base_attribute", "name")}*: #{a.dig("value_base")}\n"
        else
          reply_text += "\t*#{a.dig("base_attribute", "name")}*: #{a.dig("value_base")}/#{a.dig("value_modified")}\n"
        end
      end
    end

    if match[:option].downcase == options[:full] || match[:option].downcase == options[:skills]
      reply_text += "*Skills*:\n"
      char_hash[:skills].each do |s|
        reply_text += "\t*#{s.dig("base_skill", "name")}*: #{s.dig("value_base")}\n"
      end
    end

    if match[:option].downcase == options[:full] || match[:option].downcase == options[:defenses]
      reply_text += "*Defenses*:\n"
      char_hash[:defenses].each do |d|
        reply_text += "\t*#{d.dig("def_type")}*: #{d.dig("value_normal")}\n"
      end
    end

    client.say(channel: data.channel, text: reply_text)
  end
end
