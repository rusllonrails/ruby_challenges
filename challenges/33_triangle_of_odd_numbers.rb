# frozen_string_literal: true

#
# 33: Triangle of Odd numbers
#
# SOURCE: https://www.codewars.com/kata/sum-of-odd-numbers/train/ruby
#
# BRIEF:
#
#   Given the triangle of consecutive odd numbers:
#
#               1
#            3     5
#         7     9    11
#      13    15    17    19
#   21    23    25    27    29
# ...
#
# TASK:
#
#   Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:
#
# EXAMPLES:
#
#   ::TriangleOfOddNumbers.new(1).sum
#     => 1
#
#   ::TriangleOfOddNumbers.new(2).sum # 3 + 5 = 8
#     => 8
#

class TriangleOfOddNumbers

  attr_reader :triangle_position
  private :triangle_position

  def initialize(triangle_position)
    @triangle_position = triangle_position
  end

  def sum
    triangle_levels = []
    current_odd_number = 1

    1.upto(triangle_position) do |triangle_level|
      odd_numbers_in_level = []

      while odd_numbers_in_level.size < triangle_level do
        odd_numbers_in_level << current_odd_number
        current_odd_number += 2
      end

      triangle_levels << odd_numbers_in_level
    end

    triangle_levels.last.reduce(:+)
  end
end

