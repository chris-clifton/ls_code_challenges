require 'pry'
class RunLengthEncoding

  def initialize
  end

  def self.encode(input)
    result = []
    working_array = input.chars
    current_element = 1
    working_array.each_with_index do |element, index|
      if element == working_array[index + 1]
        current_element += 1
      elsif current_element == 1
        result << element      
      else
        result << current_element.to_s.concat(element)
        current_element = 1
      end
    end
    target_array = result.each do |word|
      word[1] * word[0].to_i if word[1]
    end
    p target_array.join('')
  end

  def self.decode(input)
    result = []
    current_number = 0
    working_array = input.chars
    working_array.each_with_index do |element, index|
      if element =~ /\d/
        current_number += element.to_i
      else
        result << current_number 
        result << element
        current_number = 0
      end
    end
    final = []
    result.each_with_index.map do |char, idx|
      if char.is_a? Integer
        final << result[idx + 1] * char 
      elsif 
        final << char
      end
    end
    p final
  end

end

# RunLengthEncoding.encode('aabbccd')
# RunLengthEncoding.encode('a1b2c')
RunLengthEncoding.decode('2a3b4c')