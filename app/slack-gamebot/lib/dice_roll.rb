class DiceRoll < Object

  attr_reader :base
  attr_reader :mod_type
  attr_reader :mod_value
  attr_reader :quantity
  attr_reader :value

  def initialize(roll_string)
    @base = roll_string
    @mod_type = modifier_type(roll_string)
    @mod_value = modifier_value(roll_string)
    @quantity = die_quantity(roll_string)
    @value = die_value(roll_string)
  end

  def modifier_type(roll_string)
    if(roll_string.split("+")[1])
      "plus"
    elsif (roll_string.split("-")[1])
      "minus"
    else
      "none"
    end
  end

  def die_quantity(roll_string)
    roll_string.split("d")[0].to_i
  end

  def die_value(roll_string)
    roll_string.split("d")[1].to_i
  end

  def modifier_value(roll_string)
    if @mod_type == "plus" then
      roll_string.split("+")[1].to_i
    elsif @mod_type == "minus" then
      0 - roll_string.split("-")[1].to_i
    else
      0
    end
  end

  def execute
    roll_results = Array.new()
    quantity.times do
      roll_results.push(1 + rand(@value))
    end
    roll_results
  end
end
