class Phrase
  attr_reader :phrase

  def initialize(phrase)
    # set @phrase to an array
    # Change all commas to a space
    # remove all punctuation except words, digits, spaces, apostrophes
    @phrase = phrase.gsub(/,/, ' ')
      .gsub(/[^\w\d\s']/, '')
      .downcase.split
  end

  def word_count
    @phrase.each_with_object({}) do |w, h|
      h.fetch(w, false) ? h[w] += 1 : h[w] = 1
    end
  end
end
