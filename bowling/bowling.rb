class Game

  attr_accessor :score

  def initialize
    @score = 0
    @frames = []
    @current_frame = []
  end

  def roll(pins)
    validate_roll!(pins)

    @current_frame << pins

    if @frames.size < 9
      if @current_frame == [10]
        @frames << @current_frame
        @current_frame = []
      elsif @current_frame.reduce(:+) == 10
        @frames << @current_frame
        @current_frame = []
      elsif @current_frame.size == 2
        @frames << @current_frame
        @current_frame = []
      end
    else # Holds logic for 10th frame
      if (@current_frame.size == 2 && @current_frame.reduce(:+) < 10) || @current_frame.size == 3
        @frames << @current_frame
      end
    end
  end

  def score
    total = 0
    10.times do 
      this_frame = @frames.shift
      if this_frame == [10]
        total += (10 + @frames.flatten.take(2).reduce(:+))
      elsif this_frame.reduce(:+) == 10
        total += (10 + @frames.flatten.take(1).first)
      else
        total += this_frame.reduce(:+)
      end
    end
    total
  end

  def validate_roll!(pins)
    raise RuntimeError, 'Pin count exceeds pins on the lane' if pins > 10
    raise RuntimeError, 'Pins must have a value from 0 to 10' if pins < 0
    # if @frames.size <= 9
    #   raise RuntimeError, 'Pin count exceeds pins on the lane'
    # end
  end

end

class Frame

  def total
    if strike?
      # do strike stuff
    elsif spare?
      # do spare stuff
    else
      # get total of two throws
    end
  end

  def tenth?
  end

  def spare?
  end

  def strike?
  end
  
  def next_frame
  end
  
end




