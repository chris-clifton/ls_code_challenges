class Scrabble

  LETTERS_AND_SCORE = {
    "aeioulnrst" => 1,
    "dg" => 2, 
    "bcmp" => 3,
    "fhvwy" => 4,
    "k" => 5,
    "jx" => 8,
    "qz" => 10
  }


  def initialize(string)
    @string = string == nil ? '' : string.downcase
  end

  def score
    score = 0
    @string.each_char do |char|
      LETTERS_AND_SCORE.each {|key, value| key.include?(char) ? score += value : next }
    end
    score
  end

  def self.score(string)
    self.new(string).score
  end


end