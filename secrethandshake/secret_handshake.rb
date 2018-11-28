class SecretHandshake

  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze 

  def initialize(number)
    @string_binary = convert_to_binary(number)
    @commands = []
  end

  def commands
    @string_binary.chars.reverse.each_with_index do |num, idx|
      @commands << COMMANDS[idx] if num == '1'
      # This line breaks so we don't iterate over index 4, which is the reverse command
      break if idx == 3
    end
    @string_binary.length == 5 ? @commands.reverse : @commands
  end

  private

  def convert_to_binary(decimal)
    if decimal.class == Integer || decimal =~ /^[0-9]+$/
      decimal.to_i.to_s(2)
    else
      '0'
    end
  end

end