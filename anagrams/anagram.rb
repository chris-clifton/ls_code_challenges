class Anagram

  attr_accessor :string, :letters
  def initialize(string)
    @string = string.downcase
    @letters = @string.chars.sort
  end

  def sorted_letters(str)
    str.downcase.chars.sort
  end


  def match(array)
    array.select { |word| sorted_letters(word) == letters && word.downcase != string }
  end

end


detector = Anagram.new('corn')
p detector.match %w(corn dark Corn rank CORN cron park)