class Year

  # on every year that is evenly divisible by 4
  #   except every year that is evenly divisible by 100
  #     unless the year is also evenly divisible by 400
  def self.leap?(y)
    f = y % 4 == 0
    oh = y % 100 == 0
    fh = y % 400 == 0
    f && (!oh || (oh && fh))
  end
end
