# frozen_string_literal: true

#
# 23: Directions Reduction
#
# BRIEF:
#
#   Create function like 'Scramble.new(str1, str2).possible?'' that returns true
#   if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
#
# EXAMPLES:
#
#   Scramble.new('rkqodlw', 'world').possible?
#     => True
#
#   Scramble.new('cedewaraaossoqqyt', 'codewars').possible?
#     => True
#
#   Scramble.new('katas', 'steak').possible?
#     => False
#

class Scramble

  ATTRS = [
    :stock_of_letters,
    :letters_and_numbers
  ].freeze

  attr_reader *ATTRS
  private *ATTRS

  def initialize(stock_of_letters, word)
    @stock_of_letters = stock_of_letters.chars
    @letters_and_numbers = word.chars.group_by do |item|
      item
    end
  end

  def possible?
    letters_and_numbers.all? do |letter, number_of_mentions|
      stock_of_letters.select do |stock_letter|
        stock_letter == letter
      end.size >= number_of_mentions.size
    end
  end
end
