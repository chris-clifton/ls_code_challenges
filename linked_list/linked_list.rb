class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, nxt = nil)
    @datum = datum
    @next = nxt
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize(el = nil)
    @head = el
  end

  def self.from_a(arr)
    curr = new
    arr.reverse.each { |el| curr.push(el) } unless arr.nil?
    curr
  end

  def push(value)
    el = Element.new(value)
    el.next = head if size > 0
    @head = el
  end

  def to_a
    return [] if empty?
    return [head.datum] unless head.next
    [head.datum] + self.class.new(head.next).to_a
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def peek
    head ? head.datum : nil
  end

  def size
    return 0 if empty?
    return 1 unless head.next
    return 1 + self.class.new(head.next).size
  end

  def empty?
    head.nil?
  end

  def pop
    old = head
    @head = old.next
    old&.datum
  end
end