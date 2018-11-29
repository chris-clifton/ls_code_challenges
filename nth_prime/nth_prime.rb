class Prime

  def self.nth(integer)
    raise ArgumentError if integer.class != Integer || integer < 1
    current_num =  3
    primes_array = [2]
    while primes_array.size < integer
      primes_array << current_num if primes_array.each do |prime|
        break false if (current_num % prime).zero?
        break true if prime * prime > current_num
      end
        current_num += 2
      end
      primes_array.last
  end
end
