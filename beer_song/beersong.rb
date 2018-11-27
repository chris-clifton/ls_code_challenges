class BeerSong

  def verse(number)
    counter = number
    case 
    when number > 2 then
      "#{counter} bottles of beer on the wall, #{counter} bottles of beer.\nTake one down and pass it around, #{counter -1} bottles of beer on the wall.\n"
    when number > 2 then
      "#{counter} bottles of beeron the wall, #{counter} bottles of beer.\nTake one down and pass it around, #{counter -1} bottle of beer on the wall.\n"
    when number == 1 then
      "#{counter} bottle of beer on the wall, #{counter} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
    end
  end

  def verses(first, last)
    first.downto(last).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    counter = 99
    loop do
      puts verse(counter)
      counter -=1
      break if counter == 1
    end
    puts verse(1)
    puts verse(0)
  end
end

test = BeerSong.new

test.lyrics
