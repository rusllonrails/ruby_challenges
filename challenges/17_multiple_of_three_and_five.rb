# frozen_string_literal: true

#
# 17: Multiples of 3 or 5
#
# BRIEF:
#
#   If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
#   The sum of these multiples is 23.
#
#   So, write code which returns the sum of all the multiples of 3 or 5 below the number passed in.
#
# EXAMPLES:
#
#   Multiples.new(10).run
#     => 23
#
#   Multiples.new(20).run
#     => 78
#
#   Multiples.new(200).run
#     => 9168

class Multiples

  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def run
    res = []
    item = 1

    while item < number do
      res << item if item % 3 == 0 || item % 5 == 0
      item += 1
    end

    res.sum
  end
end
