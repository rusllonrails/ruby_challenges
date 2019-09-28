# frozen_string_literal: true

#
# 14: Fibonacci Sequence Generator
#
# BRIEF:
#
#   In mathematics, the Fibonacci numbers, commonly denoted Fn form a sequence,
#   called the Fibonacci sequence, such that each number is the sum of the two preceding ones,
#   starting from 0 and 1. That is,
#
#     F0 = 0, F1 = 1
#
#   and for n > 1:
#
#     Fn = Fn-1 + Fn-2
#
# MORE DETAILS:
#
#   https://en.wikipedia.org/wiki/Fibonacci_number
#
# ONLINE CALCULATOR:
#
#   https://www.browserling.com/tools/fibonacci-numbers
#
# EXAMPLES:
#
#   FibonacciSequence.new(6)
#
#     => [0, 1, 1, 2, 3, 5]
#

class FibonacciSequence

  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def generate
    base = [0, 1, 1]

    if number > 3
      2.upto(Float::INFINITY).lazy.map do |i|
        match_rule = base.last(2).sum == i
        base << i if match_rule

        i if match_rule
      end.select do |i|
        i.is_a?(Integer)
      end.first(number - 3)

      base
    else
      base[0..(number - 1)]
    end
  end
end
