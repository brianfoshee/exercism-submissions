#Find the difference between the sum of the squares and the square of the sums of the first N natural numbers.

class Squares
  attr_accessor :num

  def initialize(s)
    @num = s
  end

  #Hence the difference between the sum of the squares of the first ten
  #natural numbers and the square of the sum is 3025 - 385 = 2640.
  def difference
    square_of_sums - sum_of_squares
  end

  #The sum of the squares of the first ten natural numbers is,
  #
  #    1**2 + 2**2 + ... + 10**2 = 385
  def sum_of_squares
    h = (1..@num).step(1).each_with_object({sum: 0}) do |x, s|
      s[:sum] += (x**2)
    end
    h[:sum]
  end

  #The square of the sum of the first ten natural numbers is,
  #
  #    (1 + 2 + ... + 10)**2 = 55**2 = 3025
  def square_of_sums
    h = (1..@num).step(1).each_with_object({sum: 0}) do |x, s|
      s[:sum] += x
    end
    h[:sum]**2
  end
end
