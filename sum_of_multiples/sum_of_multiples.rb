class SumOfMultiples

  def self.to(limit, multiples = [3, 5])
    (0...limit).select do |number|
      multiples.any? { |multiple| number % multiple == 0 }
    end.reduce(:+)  
  end
  
  
  def initialize(*multiples)
    @multiples = *multiples
  end

  def to(limit)
    self.class.to(limit, @multiples)
  end
end
