# frozen_string_literal: true

#
# 17: Get the Middle Character
#
# BRIEF:
#
#   Given a word.
#   Need to return the middle character of the word.
#   If the word's length is odd, return the middle character.
#   If the word's length is even, return the middle 2 characters.
#
# EXAMPES:
#
# GetMiddleCharacter.new('test').run
#   => "es"
#
# GetMiddleCharacter.new('testing').run
#   => "t"
#
# GetMiddleCharacter.new('middle').run
#   => "dd"
#

class GetMiddleCharacter

  attr_reader :word
  private :word

  def initialize(word)
    @word = word
  end

  def run
    letters = word.chars
    size = letters.size
    middle = size / 2

    if size.even?
      "#{letters[middle - 1]}#{letters[middle]}"
    else
      letters[middle]
    end
  end
end
