class Hamming
  def self.compute(x, y)
    x, y = x.chars, y.chars
    x.zip(y)
      .reject { |(a, b)| a.nil? || b.nil? } # if one contains more elements
      .reject { |(a, b)| a == b } # reject matches
      .count
  end
end