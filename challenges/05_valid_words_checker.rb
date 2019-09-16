# frozen_string_literal: true

#
# 05: Valid Words checker
#
# Given an array of characters & one word,
# find out if the word can be made from these characters.
#
# Example:
#
# word = "orange"
# characters = %w(e n g a r o)
#
# ValidWordsChecker.new(word, characters).valid?
#
#   => true
#
# word = "top"
# characters = %w(a r g t p i n y x w z)
#
# ValidWordsChecker.new(word, characters).valid?
#
#   => false
#

class ValidWordsChecker

  attr_reader :word, :characters
  private :word, :characters

  def initialize(word, characters=[])
    @word = word
    @characters = characters
  end

  def valid?
    word.chars.all? do |letter|
      characters.include?(letter)
    end
  end
end
