# frozen_string_literal: true

#
# 01: Simpe Enumerable-like module
#
# It allows to run each, map and select for sequence,
# specied by 3 parameters:
#
# - start
# - step
# - length
#

module MyEnumerable
  def map
    #
    # seq = Sequence.new(0, 5, 5)
    # seq.map { |x| x }
    #
    # => [0, 5, 10, 15, 20]
    #
    # seq.map { |x| x + 4 }
    #
    # => [4, 9, 14, 19, 24]

    res = []

    for i in scope_range
      res << yield(step * i)
    end

    res
  end

  def each
    #
    # seq = Sequence.new(0, 5, 5)
    # seq.each { |x| puts x }
    #
    # => 0
    # => 5
    # => 10
    # => 15
    # => 20
    #
    # seq.each { |x| puts x + 3 }
    #
    # => 3
    # => 8
    # => 13
    # => 18
    # => 23
    #

    for i in scope_range
      yield step * i
    end
  end

  def select
    #
    # seq = Sequence.new(0, 5, 5)
    # seq.select { |x| x > 10 }
    #
    # => [15, 20]
    #

    res = []

    for i in scope_range
      element = step * i
      res << element if yield(element)
    end

    res
  end
end

