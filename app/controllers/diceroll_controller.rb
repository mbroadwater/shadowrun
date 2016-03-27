class DicerollController < ApplicationController
  before_action :authenticate!

  def show
    render :json => {
      "response_type": "in_channel",
      "text": roll_dice
    }, status: 200
  end

  private

  def authenticate!
    unless request_is_valid?
      render json: {
        "response_type": "ephemeral",
        "text": "You done messed up."
      }, status: 401
    end
  end

  def request_is_valid?
    token_is_valid? && command_is_valid?
  end

  def token_is_valid?
    command_token = "LbtuTe82Wy1ssjYTIasvCrsW"
    params[:token] == command_token
  end

  def command_is_valid?
    params[:command] == "/roll"
  end

  def roll_dice
    roll = Hash.new
    roll.store("original_roll", params[:text])
    roll.store("mod_type", find_modifier)
    roll.store("die_quantity", params[:text].split("d")[0].to_i)
    roll.store("die_and_mod", params[:text].split("d")[1])

    if roll["mod_type"] == "plus" then
      roll.store("die_value", roll["die_and_mod"].split("+")[0].to_i)
      roll.store("mod_value", roll["die_and_mod"].split("+")[1].to_i)
    elsif roll["mod_type"] == "minus" then
      roll.store("die_value", roll["die_and_mod"].split("-")[0].to_i)
      roll.store("mod_value", 0 - roll["die_and_mod"].split("-")[1].to_i)
    else
      roll.store("die_value", roll["die_and_mod"].to_i)
      roll.store("mod_value", 0)
    end

    results = Array.new()

    roll.store("results", results)

    roll["die_quantity"].times do
      roll["results"].push(1 + rand(roll["die_value"]))
    end

    roll.store("roll_sum", roll["results"].sum + roll["mod_value"])

    "Rolled #{roll["original_roll"]} with a result of #{roll["roll_sum"]} #{roll["results"]}"

  end

  def find_modifier
    if(params[:text].split("+")[1])
      "plus"
    elsif (params[:text].split("-")[1])
      "minus"
    else
      "none"
    end
  end

end
