#require 'pry'

# Perfect number = sum of its positive divisors
# Abundant number = sum of its factors > number
# Deficient = sum of its factors < number

#input: integer
#output: string (abundant, deficient, or perfect)
#algorithm:
  # find all positive divisors of n, hold in an array
  # calculate sum of array
  # if/else outputting reuslt

class PerfectNumber

  def self.classify(int)
    raise RuntimeError if int < 0
    
    divisors = []
    1.upto(int) do |num|
      divisors << num if (int % num == 0 && num != int)
    end
        
    sum = divisors.reduce(:+)
    
    puts "#{int} // #{sum} // #{divisors}"

    case
      when sum < int then 'deficient'
      when sum > int then 'abundant'
      when sum == int then 'perfect'
    end
  end

end


PerfectNumber.classify(13)
PerfectNumber.classify(28)
PerfectNumber.classify(12)
PerfectNumber.classify(18)
PerfectNumber.classify(100)
PerfectNumber.classify(69)
PerfectNumber.classify(81)

