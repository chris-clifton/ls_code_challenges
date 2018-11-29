class CircularBuffer
  def initialize(max_size)
    @max_size = max_size
    @buffer = []
  end

  def read
    buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
  end

  def write(element)
    update_buffer(element) { raise BufferFullException }
  end

  def write!(element)
    update_buffer(element) { buffer.shift }
  end

  def clear
    buffer.clear
  end

  private

  attr_accessor :buffer
  attr_reader :max_size

  def update_buffer(element)
    return if element.nil?
    yield if buffer.size == max_size
    buffer << element
  end

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
end