# frozen_string_literal: true

#
# 06: Palindromic Primes
#
# BRIEF:
#
#   Task is to generate an array of the first N palindromic prime numbers.
#
#   So what is a palindromic prime?
#   Well, it is a number with two defining characteristics.
#
#   One, it is a palindromic number which means that when the digits are written in reverse
#   they match the original number.
#
#   For example, the number 101 is palindromic.
#   If we reverse the numbers 101 we still have the original number.
#
#   Second, the number is a prime number.
#   A prime number is only divisible by itself or the number one.
#
#   For example, the number 2, 3, 5 and 7 are all prime numbers.
#
#   The first 10 palindromic primes are: 2, 3, 5, 7, 11, 101, 131, 151, 181, 191.
#
# SO THE TASK IS:
#
#   Create a function in Ruby that will return the first n palindromic primes
#   out of the set of positive natural numbers between 2 and infinity.
#
# EXAMPLES:
#
# PalindromicPrimes.new(5).generate
#
#   => [2, 3, 5, 7, 11]
#
# PalindromicPrimes.new(10).generate
#
#   => [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
#

class PalindromicPrimes

  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def generate
    2.upto(Float::INFINITY).lazy.map do |i|
      i if palindromic_number?(i) && prime_number?(i)
    end.select do |i|
      i.is_a?(Integer)
    end.first(number)
  end

  def palindromic_number?(item)
    #
    # A palindromic number which means that when the digits are written in reverse
    # they match the original number.
    #
    # For example:
    #
    #   The number 101 is palindromic.
    #   If we reverse the numbers 101 we still have the original number.
    #
    item = item.to_s
    item == item.reverse
  end

  def prime_number?(item)
    #
    # A prime number is only divisible by itself or the number one.
    #
    # For example, the number 2, 3, 5 and 7 are all prime numbers.
    #
    2.upto(item - 1) do |i|
      return false if item % i == 0
    end

    true
  end
end
