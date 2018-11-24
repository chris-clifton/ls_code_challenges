class Phrase

  def initialize(string)
    @string = string
  end

  def word_count
    count = Hash.new(0)

    @string.scan(/\b[\w']+\b/) do |word|
      count[word.downcase] += 1
    end
    count
  end
end

test = Phrase.new('one fish two fish red fish blue fish')
p test.word_count