class Octal

  BASE = 8
  INVALID_OCTAL =/\D|[8-9]/


  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    octal_string =~ INVALID_OCTAL ? 0 : calculate
  end  

  private

  def calculate
    decimal = 0
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index)
    end
    decimal
  end

end