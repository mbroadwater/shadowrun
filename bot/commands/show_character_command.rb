require 'rest-client'

class ShowCharacterCommand < SlackRubyBot::Commands::Base
  options = {
    full: "full",
    details: "details",
    attributes: "attributes",
    skills: "skills",
    defenses: "defenses",
  }

  match /^show (?<option>\w*) (?<character>\w*\s?\w*)/ do |client, data, match|
    # response = RestClient.get("https://shadowguild.herokuapp.com/api/v1/characters/?name=#{match[:character]}")
    response = RestClient.get("localhost:3000/api/v1/characters/?name=#{match[:character]}")
    response_json = JSON.parse(response)

    char_hash = {
      name: response_json.dig("character", "name"),
      details: response_json.dig("character", "character_detail"),
      user_id: response_json.dig("character", "user_id"),
      attributes: response_json.dig("character", "char_attributes"),
      skills: response_json.dig("character", "active_skills"),
      defenses: response_json.dig("character", "defenses"),
      specialties: response_json.dig("character", "skill_specialties")
    }

    reply_text = "*Name*: #{char_hash[:name]}\n\n"

    if match[:option].downcase == options[:details]
      logger.debug("in details")
      reply_text += "\t*Real Name*: #{char_hash[:details].dig("real_name")}\n"
      reply_text += "\t*Concept*: #{char_hash[:details].dig("concept")}\n"
      reply_text += "\t*Metatype*: #{char_hash[:details].dig("metatype")}\n"
      reply_text += "\t*Gender*: #{char_hash[:details].dig("gender")}\n"
      reply_text += "\t*Hair*: #{char_hash[:details].dig("hair")}\n"
      reply_text += "\t*Eyes*: #{char_hash[:details].dig("eyes")}\n"
      reply_text += "\t*Ethnicity*: #{char_hash[:details].dig("ethnicity")}\n"
      reply_text += "\t*Skin color*: #{char_hash[:details].dig("skin")}\n"
      reply_text += "\n*Description:*:\n"
      reply_text += "#{char_hash[:details].dig("description")}\n\n"
      reply_text += "\n*Background*:\n"
      reply_text += "#{char_hash[:details].dig("background")}\n\n"
    end

    if match[:option].downcase == options[:full] || match[:option].downcase == options[:attributes]
      reply_text += "*Attributes*:\n"

      char_hash[:attributes].each do |a|
        if a.dig("value_modified").nil? || a.dig("value_base") == a.dig("value_modified")
          if a.dig("base_attribute", "name").downcase == "essence"
            reply_text += "\t*#{a.dig("base_attribute", "name")}*: #{a.dig("value_base")}\n"
          else
            reply_text += "\t*#{a.dig("base_attribute", "name")}*: #{a.dig("value_base").to_i}\n"
          end
        else
          reply_text += "\t*#{a.dig("base_attribute", "name")}*: #{a.dig("value_base").to_i}/#{a.dig("value_modified").to_i}\n"
        end
      end
    end

    if match[:option].downcase == options[:full] || match[:option].downcase == options[:skills]
      logger.debug(char_hash[:specialties])
      reply_text += "*Skills*:\n"
      char_hash[:skills].each do |sk|
        reply_text += "\t*#{sk.dig("base_skill", "name")}*: #{sk.dig("value_base")}\n"
        char_hash[:specialties].each do |sp|
          if sk.dig("base_skill", "id") == sp.dig("base_skill_specialty", "base_skill_id")
            reply_text += "\t\t*#{sp.dig("base_skill_specialty", "name")}*: #{sk.dig("value_base")+2}\n"
          end
        end
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
