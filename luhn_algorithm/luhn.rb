# input: integer
# output: varies... looking for checksum as integer and array for addends method
# algorithm:
  # iterate starting with rightmost digit
  # moving left, multiply every other digit by two
    # if digit > 10 then subtract 9
  # if sum of new number % 10 == 0 then it is valid according to Luhn

class Luhn

  attr_reader :mutated_number

  def initialize(input)
    @digits = input.to_s.chars.map(&:to_i)
  end
  
  def self.create(number)
    new_base_number = number * 10
    if new(new_base_number).valid?
      new_base_number
    else
      luhn_remainder = new(new_base_number).checksum % 10
      new_base_number + (10 - luhn_remainder)
    end
  end

  def addends
    result = []
    @digits.reverse.each_with_index do |num, index|
      index.even? ? result << num : result << luhn_op(num)
    end
    result.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def luhn_op(number)
    result = number * 2
    result > 10 ? result - 9 : result
  end

end

test = Luhn.new(8631)
p test
p test.checksum
p test.valid?