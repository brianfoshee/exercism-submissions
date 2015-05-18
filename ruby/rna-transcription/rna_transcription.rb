class Complement
  # DNA => RNA
  TRANSCRIPTION = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(strand)
    iterate(strand, :has_key?, :[])
  end

  def self.of_rna(strand)
    iterate(strand, :has_value?, :key)
  end

  private

  def self.iterate(strand, m, n)
    strand.chars.map do |c|
      raise ArgumentError if !TRANSCRIPTION.send(m, c)
      TRANSCRIPTION.send(n, c)
    end
      .join
  end
end
