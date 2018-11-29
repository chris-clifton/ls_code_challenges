# Protein Translation
Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

```ruby
RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"
```

There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.

There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:

```ruby
RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"
```

Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--

Below are the codons and resulting Amino Acids needed for the exercise.

| Codon	| Amino Acids |
|:------|:------------|
|AUG|	Methionine|
|UUU, UUC|	Phenylalanine
|UUA, UUG	|Leucine
|UCU, UCC, UCA, UCG	|Serine
|UAU, UAC	|Tyrosine
|UGU, UGC	|Cysteine
|UGG	|Tryptophan
|UAA, UAG, UGA	|STOP



------------------------------

awesome student solution
```ruby
class Translation
  VALUES = { 'AUG' => 'Methionine', ["UUU", "UUC"] => 'Phenylalanine',
          ["UUA", "UUG"] => 'Leucine', ["UCU", "UCC", "UCA", "UCG"] => 'Serine',
          ["UAU", "UAC"] => 'Tyrosine', ["UGU", "UGC"] => 'Cysteine',
          'UGG' => 'Tryptophan'}
  STOP = ["UAA", "UAG", "UGA"]

  def self.of_codon(codon)
      return 'STOP' if STOP.include?(codon)
      VALUES.select {|k,_| k.include?(codon) }.values.first
  end

  def self.of_rna(strand)
    raise InvalidCodonError, "'A', 'U', 'G', 'C' are only valid nucleotides" if strand.match(/[^AUCG]/)

    strand.scan(/.../).map { |codon| self.of_codon(codon) } # calls class method #of_codon above
          .take_while {|el| el != 'STOP' } # returns array portion before encountering a 'STOP' element value returned from #of_codon in block
  end
end

class InvalidCodonError < StandardError # creating custom error class for error `InvalidCodonError`
end
```