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

  private

  def self.prime_factors(n)
    Prime.prime_division(n)
      .flatten
      .delete_if { |f| !Prime.prime?(f) } # sometimes 1 sneaks in
      .uniq
      .map { |f| RULES[f] }
      .join
  end

  # Not using this, but an algo for determining primes
  # https://en.wikipedia.org/wiki/Primality_test
  def is_prime?(n)
    return n > 1 if n <=3
    return false if n % 2 == 0 || n % 3 == 0

    i = 5
    while i*i <= n
      return false if (n % i == 0 || n % (i + 2) == 0)
      i += 6
    end

    true
  end
end
