class Bob

  def initialize
  end

  # Bob answers 'Sure.' if you ask him a question.
  # He answers 'Whoa, chill out!' if you yell at him.
  # He says 'Fine. Be that way!' if you address him without actually saying
  # anything.
  # He answers 'Whatever.' to anything else.
  def hey(remark)
    @remark = remark
    response = ''
    while response == ''
      response = next_test
    end
    @test = -1 # reset in case another call happens
    response
  end

  private

  def next_test
    @test ||= -1
    @test += 1
    case @test
    when 0 then test_question
    when 1 then test_yell
    when 2 then test_ambiguous
    else
      "Whatever."
    end
  end

  def test_ambiguous
    tmp = @remark.gsub(/\s/, '')
    if tmp == ''
      'Fine. Be that way!'
    else
      ''
    end
  end

  def test_question
    tmp = @remark.dup.gsub /[^a-zA-Z|?]+/, ''
    if tmp[-1] == "?" && test_yell == ''
      "Sure."
    else
      ''
    end
  end

  def test_yell
    tmp = @remark.dup.gsub /[^a-zA-Z]/, ''
    if tmp == ''
      ''
    elsif tmp.upcase! == nil
      "Whoa, chill out!"
    else
      ''
    end
  end
end