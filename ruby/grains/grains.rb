class Grains
  SQUARES = 64

  # One grain on the first square of a chess board. Two grains on
  # the next. Four on the third, and so on.
  #
  # There are 64 squares on a chessboard.
  #
  # Write a program that shows:
  # - how many grains were on each square, and
  # - the total number of grains
  def self.square(n)
    2**(n-1)
  end

  def self.total
    1.upto(SQUARES)
      .each_with_object({sum: 0}) { |n, o| o[:sum] += square(n) }
      .fetch(:sum)
  end
end