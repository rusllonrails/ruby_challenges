# frozen_string_literal: true

#
# 10: Prime function
#
# BRIEF:
#
#   Need to write a method 'prime?' that takes an argument
#   and returns true or false depending on if the number is prime or not.
#
#   A prime number is only divisible by itself or the number one.
#
# EXAMPLES:
#
# prime?(3)
#
#   => true
#
# prime?(17)
#
#   => true
#
# prime?(22)
#
#   => false
#

def prime?(number)
  return false if number == 1

  2.upto(number - 1) do |item|
    return false if number % item == 0
  end

  true
end
