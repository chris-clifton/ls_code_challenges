class InvalidCodonError < StandardError; end

class Translation

  AMINO_ACIDS = {
    'Methionine' => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'],
    'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'],
    'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'],
    'STOP' => ['UAA', 'UGA', 'UAG']
  }

  def self.of_codon(codon)
    result = ''
    AMINO_ACIDS.each_pair do |key, value|
      if value.include?(codon) 
        result << key
      end   
    end
    result
  end

  def self.of_rna(strand)
    result = []
    working_array = strand.chars.each_slice(3).to_a
    working_array.map do |sub_array|
      codon = sub_array.join
      if !AMINO_ACIDS.values.flatten.include?(codon)
        raise InvalidCodonError
      elsif self.of_codon(codon) == 'STOP'
        break
      else
        result << self.of_codon(codon)
      end
    end
    result
  end
end