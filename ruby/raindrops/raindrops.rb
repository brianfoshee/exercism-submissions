require 'prime'

class Raindrops
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(n)
    out = prime_factors(n)
    out == "" ? n.to_s : out
  end

  #private

  def self.prime_factors(n)
    Prime.prime_division(n)
      .flatten
      .delete_if { |f| !Prime.prime?(f) } # sometimes 1 sneaks in
      .uniq
      .map { |f| RULES[f] }
      .join
  end
end