class Crypto

  def initialize(text)
    @text = text
    @clean_text = ''
    @columns = 0
    @clean_text_seg = ''
    @ciphered_text = ''
  end

  def normalize_plaintext
    @clean_text = @text.downcase.gsub(/\W|_|' '/, '')
  end

  def plaintext_segments
    size
    @clean_text_seg = @clean_text.scan(/.{1,#{@columns}}/)
  end

  def size
    normalize_plaintext
    square = find_next_perfect_square(@clean_text.size)
    @columns = Math.sqrt(square).to_i   
  end
  
  def find_next_perfect_square(int)
    sqrt = Math::sqrt(int)
      if (int == sqrt.floor**2)
        int
      else
        (sqrt.floor + 1)**2
      end
  end

  def ciphertext
    target_array = []
    counter = 0
    @columns.times do 
      @clean_text_seg.each do |word|
        target_array << word[counter]
      end
      counter += 1
    end
    @ciphered_text = target_array.join('')
  end

  def normalize_ciphertext
    @ciphered_text.scan(/.{1,#{@columns}}/)
  end

end