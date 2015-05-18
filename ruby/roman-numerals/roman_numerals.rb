class Integer
  # I, V, X, L, C, D, M
  NUMERALS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    return NUMERALS[self] if NUMERALS[self]

    self.to_s.chars
      .reverse # need to multiply by digit place
      .map.with_index { |x, i| solve(x.to_i, i) }
      .reverse
      .join
  end

  private

  def solve(x, i)
    case i
    when 0 # ones
      handle(x, NUMERALS[1], NUMERALS[5], NUMERALS[10])
    when 1 # tens
      handle(x, NUMERALS[10], NUMERALS[50], NUMERALS[100])
    when 2 # hundreds
      handle(x, NUMERALS[100], NUMERALS[500], NUMERALS[1000])
    when 3 # thousands
      return NUMERALS[1000] * x
    else
      raise ArgumentError
    end
  end

  # x is an integer from 0-9
  # low is the low end numeral eg "I"
  # mid is the medium end numeral eg "V"
  # mid is the high end numeral eg "X"
  def handle(x, low, mid, high)
    case x
    when 0 then ''
    when 1 then low
    when 2 then low * 2
    when 3 then low * 3
    when 4 then low + mid
    when 5 then mid
    when 6 then mid + low
    when 7 then mid + low * 2
    when 8 then mid + low * 3
    when 9 then low + high
    else raise ArgumentError.new("passed #{x}")
    end
  end
end
