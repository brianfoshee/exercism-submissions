#Find the difference between the sum of the squares and the square of the sums of the first N natural numbers.

class Squares

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
    iterator[:squares]
  end

  #The square of the sum of the first ten natural numbers is,
  #
  #    (1 + 2 + ... + 10)**2 = 55**2 = 3025
  def square_of_sums
    iterator[:sums]**2
  end

  private

  def iterator
    (1..@num)
      .step(1)
      .each_with_object({sums: 0, squares: 0}) do |num, hash|
      hash[:sums] += num
      hash[:squares] += num**2
    end
  end

end
