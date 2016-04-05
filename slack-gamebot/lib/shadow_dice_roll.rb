class ShadowDiceRoll < Object

  attr_reader :base
  attr_reader :quantity
  attr_reader :edge
  attr_reader :explosions = 0

  def initialize(roll_string)
    @base = roll_string
    @quantity = die_quantity(roll_string)
    @edge = edge_value(roll_string)
  end

  def die_quantity(roll_string)
    roll_string.split("e")[0].to_i
  end

  def edge_value(roll_string)
    roll_string.split("e")[1].to_i
  end

  def execute
    roll_results = Array.new()
    quantity.times do
      roll_results.push(1 + rand(6))
    end
    roll_results
  end
end
