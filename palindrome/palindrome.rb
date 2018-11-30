
class Palindromes
  attr_reader :palindromes, :min_factor, :max_factor
  
  Palindrome = Struct.new(:factors, :value)

  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    (min_factor..max_factor).to_a.repeated_combination(2) do |x,y|
      palindromes[x * y] << [x,y] if palindrome?(x * y)
    end
  end

  def largest
    Struct.new(:value, :factors).new(largest_product, palindromes[largest_product])
  end

  def smallest
    Struct.new(:value, :factors).new(smallest_product, palindromes[smallest_product])
  end

  def smallest_product
    palindromes.keys.min
  end

  def largest_product
    palindromes.keys.max
  end 

  def palindrome?(integer)
    integer.to_s == integer.to_s.reverse
  end
  
end