class Diamond


  # def initialize(letter)
  #   @max_letter = letter
  # end

  def self.make_diamond(input)
    entries = ('A'..input).to_a + ('A'..input).to_a.reverse[1..-1]
    
    output_line = ('A'..input).to_a.reverse.join + ('A'..input).to_a[1..-1].join
    
    entries.each_with_object("") do |entry, result|
      result << output_line.gsub(/[^#{entry}]/, ' ') + "\n"
    end
  end


end

puts Diamond.make_diamond('E')

