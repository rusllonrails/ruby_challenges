# frozen_string_literal: true

#
# Class generates simple Sequence of numbers,
# based on 3 parameters:
#
# - start
# - step
# - length
#

require './samples/01_my_enumerable.rb'
require './samples/02_my_sortable.rb'

class Sequence
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

  private

  def collection
    res = []

    for i in scope_range
      res << step * i
    end

    res
  end

  def scope_range
    start..(length - 1)
  end
end
