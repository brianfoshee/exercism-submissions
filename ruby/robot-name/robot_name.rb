class Robot
  attr_accessor :name

  def initialize
    reset
  end

  def reset
    @name = generate_name
  end

  private

  # returns a string in the form "AB123"
  def generate_name
    str = 2.times.map { (65 + Random.rand(26)).chr }.join
    str += 3.times.map { Random.rand(9) }.join
  end
end