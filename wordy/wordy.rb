class WordProblem

  OPERATIONS = { 'plus' => '+', 'minus' => '-', 'divided' => '/', 'multiplied' => '*' }

  attr_reader :operators, :numbers


  def initialize(text)
    @numbers = text.scan(/-?\d+/).map(&:to_i)
    @operators = text.scan(/plus|minus|divided|multiplied/)

    raise ArgumentError, "Question not recognized" if @numbers.empty? || @operators.empty?
  end

  def answer
    @operators.each_with_index.reduce(@numbers.first) do |result, (operator, idx)|
      result.send OPERATIONS[operator], @numbers[idx + 1]
    end
  end
end