class House
  
  def self.recite
    new.recite
  end
  
  def recite
    song = ""
    (1..pieces.size).each do |lines|
      song += combine_pieces(pieces.last(lines))
      if lines != pieces.size
          song += "\n\n"
      else 
        song += "\n"
      end
    end
    song
  end

  def combine_pieces(pieces)
    line = "This is " 
    pieces.each do |piece|
      line += piece[0]
      line += "\n" if piece[1]
      line += (piece[1] + ' ') if piece[1]
    end
    line + '.'
  end

  #private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

House.recite