class Bst
  attr_reader :data, :left, :right
  # attr_accessor :left, :right

  def initialize(number)
    @data = number
  end

  def insert(number)
    if number <= @data
      if @left
        @left.insert(number)
      else
        @left = Bst.new(number)
      end
    else 
      if @right
        @right.insert(number)
      else
        @right = Bst.new(number)
      end
    end
  end

  def each(&block)
    to_a.each(&block)
    #returns enumerator if block_given? is false
  end

  def to_a
    [left.to_a, data, right.to_a].flatten
  end

end