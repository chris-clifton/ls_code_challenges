class Robot
  attr_reader :bearing, :coordinates

  BEARINGS = [:east, :west, :north, :south]

  def initialize
    @eastwest = 0
    @northsouth = 0
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise(ArgumentError) unless BEARINGS.include?(direction)
    @bearing = direction
  end

  def turn_right
    case @bearing
    when :north then @bearing = :east
    when :east then @bearing = :south
    when :south then @bearing = :west
    when :west then @bearing = :north
    end
  end

  def turn_left
    case @bearing
    when :north then @bearing = :west
    when :east then @bearing = :north
    when :south then @bearing = :east
    when :west then @bearing = :south
    end
  end
  
  def at(x, y)
    @eastwest = x
    @northsouth = y
    @coordinates = [@eastwest, @northsouth]
  end

  def advance
    case @bearing
    when :north then @coordinates[1] += 1
    when :south then @coordinates[1] -= 1
    when :east then @coordinates[0] += 1
    when :west then @coordinates[0] -= 1
    end
  end

end

class Simulator

  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(input)
    input.each_char.map { |instruction| INSTRUCTIONS[instruction] }
  end

  def place(robot_object, x:, y:, direction:)
    robot_object.orient(direction)
    robot_object.at(x, y)
  end

  def evaluate(robot, commands)
    instructions(commands).each do |command|
      robot.send(command)
    end
  end
end