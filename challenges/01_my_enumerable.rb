# frozen_string_literal: true

#
# 01: Simple Enumerable-like module
#
# Image you do not have each, map and select.
# Try implement own simple Enumerable module for collection object.
#
# Methods todo:
#
# - each
# - map
# - select
#
# Examples:
#
# seq = SequenceGenerator.new(0, 5, 5)
#
# seq.map { |x| x }
#
#   => [0, 5, 10, 15, 20]
#
# seq.map { |x| x + 4 }
#
#   => [4, 9, 14, 19, 24]
#
# seq.each { |x| puts x + 3 }
#
#   => 3
#   => 8
#   => 13
#   => 18
#   => 23
#
# seq.select { |x| x > 10 }
#
#   => [15, 20]
#

module MyEnumerable
  def map
    res = []

    for i in scope_range
      res << yield(step * i)
    end

    res
  end

  def each
    for i in scope_range
      yield(step * i)
    end
  end

  def select
    res = []

    for i in scope_range
      element = step * i
      res << element if yield(element)
    end

    res
  end
end


