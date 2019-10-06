# frozen_string_literal: true

#
# 30: Alphabetical Addition
#
# SOURCE: https://www.codewars.com/kata/alphabetical-addition/train/ruby
#
# BRIEF:
#
#   The function will be given a variable amount of arguments, each one being a letter to add.
#
# NOTES:
#
#   - Letters will always be lowercase.
#   - Letters can overflow (see second to last example of the description)
#   - If no letters are given, the function should return 'z'
#
# EXAMPLES:
#
#   AlphabeticalAddition.new('a', 'b', 'c').letter_detected
#     => 'f'
#
#   AlphabeticalAddition.new('a', 'b').letter_detected
#     => 'c'
#
#   AlphabeticalAddition.new('z').letter_detected
#     => 'z'
#
#   AlphabeticalAddition.new('z', 'a').letter_detected
#     => 'a'
#
#   AlphabeticalAddition.new('y', 'c', 'b').letter_detected
#     => 'd'
#
#   AlphabeticalAddition.new().letter_detected
#     => 'z'
#

class AlphabeticalAddition

  attr_reader :letters
  private :letters

  def initialize(*letters)
    @letters = letters
  end

  def letter_detected
    return 'z' unless letters.any?

    ('a'..'z').to_a.rotate(sum_of_positions - 1).first
  end

  private

  def sum_of_positions
    letters.map do |letter|
      ('a'..'z').to_a.index(letter) + 1
    end.reduce(:+)
  end
end
