# frozen_string_literal: true

#
# 34: Sub-array elements sum
#
# SOURCE: https://www.codewars.com/kata/sub-array-elements-sum/train/ruby
#
# BRIEF:
#
#   Given an array (or list or vector) of arrays (or, guess what, lists or vectors) of integers,
#   your goal is to return the sum of a specific set of numbers,
#   starting with elements whose position is equal to the main array length and
#   going down by one at each step.
#
#   Say for example the parent array (etc, etc) has 3 sub-arrays inside:
#   you should consider the third element of the first sub-array,
#   the second of the second array and the first element in the third one:
#
#   [[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]]
#
#   would have you considering 1 for [3, 2, 1, 0],
#   6 for [4, 6, 5, 3, 2] and
#   9 for [9, 8, 7, 4],
#
#   which sums up to 16.
#
#   One small note is that not always each sub-array will have enough elements,
#   in which case you should then use a default value (if provided) or 0 (if not provided).
#
# EXAMPLES:
#
#   ::SubArrayElementsSum.new([[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]]).sum
#     => 16
#
#   ::SubArrayElementsSum.new([[3], [4, 6, 5, 3, 2], [9, 8, 7, 4]]).sum
#     => 15
#
#   ::SubArrayElementsSum.new([[3, 2, 1, 0], [4, 6, 5, 3, 2], []]).sum
#     => 7
#
#   ::SubArrayElementsSum.new([[3, 2, 1, 0], [4, 6, 5, 3, 2], []], 5).sum
#     => 12
#
#   ::SubArrayElementsSum.new([[3, 2], [4], []]).sum
#     => 0
#

class SubArrayElementsSum

  attr_reader :array, :default_number
  private :array, :default_number

  def initialize(array, default_number=0)
    @array = array
    @default_number = default_number
  end

  def sum
    counter = 0
    array_size = array.size

    array.map do |child_array|
      target_element_of_array = child_array[array_size - 1]
      counter += target_element_of_array ? target_element_of_array : default_number

      array_size -= 1
    end

    counter
  end
end
