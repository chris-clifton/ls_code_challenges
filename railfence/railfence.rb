class RailFenceCipher

  
  def self.encode(text, rails)
    return "" if text.empty?
    return text if rails > text.size || rails == 1
    
    working_text = text.gsub(' ', '').chars
    working_array = [""] * rails
    
    rails.times do |int|
      working_array[int] += working_text.shift
    end

    loop do    
      (rails - 1).downto(0) do |int|
        next if int == rails - 1
        break if working_text.size < 1
        working_array[int] += working_text.shift
      end
  
      rails.times do |int|
        next if int == 0
        break if working_text.size < 1
        working_array[int] += working_text.shift
      end

      break if working_text.size < 1
    end

    working_array.join  
  end

  def self.decode(text, rails)
    return "" if text.empty?
    return text if rails == 1

    (text.chars.zip encode((0...text.size).map(&:chr), ).chars.map(&:ord))
    .sort_by(&:last)
    .map(&:first)
    .join
  end
   

end
RailFenceCipher.encode('THEDEVILISINTHEDETAILS', 3)
RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
