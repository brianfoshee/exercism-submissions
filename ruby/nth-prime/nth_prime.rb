class Prime

  def self.nth(n)
    raise ArgumentError if n == 0

    i = primes = 0
    until primes == n do
      i += 1
      primes += 1 if is_a_prime?(i)
    end
    i
  end

  private

  def is_a_prime?(n)
    return n > 1 if n <= 3
    return false if n % 2 == 0 || n % 3 == 0

    x = 5
    while x*x <= n do
      if n % x == 0 || n % (x+2) == 0
        return false
      end
      x += 6
    end
    true
  end

end