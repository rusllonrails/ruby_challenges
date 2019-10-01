# frozen_string_literal: true

#
# 26: Range Extraction
#
# BRIEF:
#
#   A format for expressing an ordered list of integers is to use a comma separated list of either
#   individual integers or a range of integers denoted by the starting integer separated from
#   the end integer in the range by a dash, '-'.
#
#   The range includes all integers in the interval including both endpoints.
#   It is not considered a range unless it spans at least 3 numbers.
#
#   For example: ("12, 13, 15-17")
#
# TASK:
#
#   Complete the solution so that it takes a list of integers in increasing order and
#   returns a correctly formatted string in the range format.
#
# EXAMPLE:
#
#   RangeExtraction.new(
#     [-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]
#   ).format
#
#     => "-6,-3-1,3-5,7-11,14,15,17-20"
#

class RangeExtraction

  attr_reader :array
  private :array

  def initialize(array)
    @array = array
  end

  def convert
    @res = []
    @current_range = []

    array.each_with_index do |current_item, current_position|
      if current_position < array.size
        next_item = array[current_position + 1]

        if next_item == current_item + 1
          @current_range << current_item
        else
          no_further_range(current_item)
        end
      else
        no_further_range(current_item)
      end
    end

    format_to_str
  end

  private

  def no_further_range(current_item)
    @res << if @current_range.any?
      @current_range << current_item
    else
      current_item
    end

    @current_range = []
  end

  def format_to_str
    @res.map do |item|
      item.is_a?(Array) && item.size > 2 ? "#{item.min}-#{item.max}" : item
    end.flatten.join(',')
  end
end
