# frozen_string_literal: true

#
# 01: Simple Enumerable-like module
#
# It allows to run iterate collection via:
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
# NOTE: Reason of that module is just to try imagine
#       that you do not have these methods in ruby implemented
#       and try build own implementation of them. JUST FOR FUN! =)
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


