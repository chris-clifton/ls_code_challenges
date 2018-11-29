require 'pry'

class PhoneNumber

  INVALID_NUMBER = '0000000000'

  def initialize(number)
    @number = number
    clean_number
    validate_length
  end

  def number
    @number
  end

  def area_code
    @number[0..2]
  end

  def prefix
    @number[3..5]
  end

  def line_number
    @number[6..9]
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end

  private

  def clean_number
    if @number.chars.any?(/[a-zA-Z]/)
      @number = INVALID_NUMBER
    else
      @number = @number.gsub(/[\D]/, '').strip
    end
  end

  def validate_length
    @number.slice!(0, 1) if @number[0] == '1' && @number.length == 11
    if @number.length == 10
      @number      
    else
      @number = INVALID_NUMBER
    end  
  end

end