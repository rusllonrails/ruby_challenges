# frozen_string_literal: true

#
# 03: Sequence generator
#
# It generates simple sequence of numbers,
# based on 3 parameters:
#
# - start (ability to start sequence with custom number)
# - step (step between each element in generating sequence)
# - length (total number of sequence elements)
#
# Examples:
#
# s = SequenceGenerator.new(0, 1, 5).collection
#
#   => [0, 1, 2, 3, 4]
#
# s = SequenceGenerator.new(0, 3, 4).collection
#
#   => [0, 3, 6, 9]
#
# s = SequenceGenerator.new(15, 5, 5).collection
#
#   => [15, 20, 25, 30, 35]
#

require './samples/01_my_enumerable.rb'
require './samples/02_my_sortable.rb'

class SequenceGenerator

  include MyEnumerable
  include MySortable

  attr_reader :start,
              :step,
              :length

  def initialize(start, step, length)
    @start = start
    @step = step
    @length = length
  end

  def collection
    res = []

    for i in scope_range
      res << (start + i * step)
    end

    res
  end

  private

  def scope_range
    0..(length - 1)
  end
end
