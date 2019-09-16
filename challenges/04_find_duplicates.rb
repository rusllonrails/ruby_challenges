# frozen_string_literal: true

#
# 04: Find Duplicates in array
#
# Given an array with Integer values
# you need to find all the duplicated numbers.
#
# Example:
#
# FindDuplicates.new(
#   [1,3,2,4,2,5,6,9,4,4,8,7,9]
# ).duplicates
#
#   => [2,4,9]
#

class FindDuplicates

  attr_reader :array
  private :array

  def initialize(array)
    @array = array
  end

  def duplicates
    dups = []
    seen = []

    array.each do |element|
      if seen.include?(element) && !dups.include?(element)
        dups << element
      end

      seen << element
    end

    dups
  end
end
