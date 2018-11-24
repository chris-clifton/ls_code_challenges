class Sieve

  attr_accessor :range

  def initialize(limit)
    @range = (2..limit).to_a
  end

  def primes
    range.each do |prime|
      range.reject! { |num| (num != prime) && (num % prime == 0) }
    end
    range
  end

end

sieve = Sieve.new(10)

p sieve.primes