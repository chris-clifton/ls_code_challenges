class Triplet
  attr_reader :a, :b, :c

  def initialize(*numbers)
    @a = numbers[0]
    @b = numbers[1]
    @c = numbers[2]
  end

  def self.where(args)
    max_factor = args[:max_factor] || 10
    min_factor = args[:min_factor] || 1
    sum = args[:sum]
    result = []
    
    combinations(min_factor.upto(max_factor).to_a).each do |combo|
      triplet = Triplet.new(combo[0], combo[1], combo[2])

      if triplet.pythagorean?
        if sum
          result << triplet if triplet.sum == sum
        else
          result << triplet
        end
      end
    end
    result
  end

  def self.combinations(arr)
    arr
    .product(arr)
    .product(arr)
    .map(&:flatten)
    .map(&:sort)
    .uniq
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  
end