# Implement octal to decimal conversion
# Given an octal input string, program should produce a decimal output

# Treat invalid input as octal 0

class Octal

  attr_accessor :base10

  def initialize(number)
    @base10 = number.to_i
    validate_input
  end

  def validate_input
    if base10 != Integer.class
      base10 = 0
    end
  end

  def to_decimal
    reverse_array = base10.digits
    result_array = []
    counter = 0
    reverse_array.each do |num|
      result_array << num*10**counter
      counter +=1
    end
    p result_array.reverse.reduce(:+)
  end   

end

test = Octal.new('123')

test.to_decimal



