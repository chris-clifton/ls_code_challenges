class Trinary

  INVALID_OPTION = /\D|[4-9]/

  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    trinary_string =~ INVALID_OPTION ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    trinary_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (3**index)
    end
    decimal
  end
end