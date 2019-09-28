# frozen_string_literal: true
#
# 16: Digital Root
#
# BRIEF:
#
#   Create a digital root function.
#
#   A digital root is the recursive sum of all the digits in a number.
#   Given n, take the sum of the digits of n.
#
#   If that value has more than one digit, continue reducing in this way
#   until a single-digit number is produced.
#
#   This is only applicable to the natural numbers.
#
# EXAMPLES:
#
#   DigitalRoot.root(16)
#     => 1 + 6
#     => 7
#
#   DigitalRoot.root(132189)
#     => 1 + 3 + 2 + 1 + 8 + 9
#     => 24 ...
#     => 2 + 4
#     => 6
#
#   DigitalRoot.root(493193)
#     => 4 + 9 + 3 + 1 + 9 + 3
#     => 29 ...
#     => 2 + 9
#     => 11 ...
#     => 1 + 1
#     => 2
#

class DigitalRoot
  class << self
    def root(number)
      sum = -> (n) do
        n.to_s
              .split('')
              .map(&:to_i)
              .reduce(:+)
      end

      while number > 9
        number = sum.(number)
      end

      number
    end
  end
end
