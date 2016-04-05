class ShadowDiceRoll < Object

  attr_reader :base
  attr_reader :quantity
  attr_reader :edge
  attr_reader :explosions
  attr_reader :total
  attr_reader :hits
  attr_reader :outcome
  attr_reader :ones

  def initialize(roll_string)
    @base = roll_string
    @quantity = die_quantity(roll_string)
    @edge = edge_value(roll_string)
    @total = @quantity + @edge
    @hits = 0
    @explosions = 0
    @ones = 0
    @outcome = Array.new
  end

  def die_quantity(roll_string)
    roll_string.split("e")[0].to_i
  end

  def edge_value(roll_string)
    roll_string.split("e")[1].to_i
  end

  def execute
    @total.times do
      roll_dice
    end
  end

  def roll_dice
    @outcome.push(1 + rand(6))
    if @outcome.last >= 5
      @hits += 1
    end
    if @outcome.last == 1
      @ones += 1
    end
    if @edge > 0 and @outcome.last == 6
      @explosions += 1
      roll_dice
    end
  end
end
