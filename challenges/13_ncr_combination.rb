# frozen_string_literal: true

#
# 13: nCr Comnbination
#
# BRIEF:
#
#   In mathematics, a combination is a selection of items from a collection,
#   such that (unlike permutations) the order of selection does not matter.
#
#   For example, given three fruits, say an apple, an orange and a pear,
#   there are three combinations of two that can be drawn from this set:
#
#   - an apple and a pear;
#   - an apple and an orange;
#   - or a pear and an orange.
#
#   More formally, a k-combination of a set S is a subset of k distinct elements of S.
#   If the set has n elements, the number of k-combinations is equal to the binomial coefficient,
#   which can be written using factorials as:
#
#   n! / ( k! * (n - k)! )
#
#   whenever k <= n, and which is zero when k > n.
#
# IMPORTANT CONDITION:
#
#   Combination should be a variable that stores a partial application which computes combination.
#
# NOTE:
#
#   You can check your function results and get more info about challenge here:
#   https://www.calculator.net/permutation-and-combination-calculator.html
#
# EXAMPLE:
#
#   combination_func = NcrCombination.new.generate
#
#   ncr_proc = combination_func.(6)
#   ncr_proc.(2)
#
#   => 15
#

class NcrCombination
  def generate
    combination_func = -> (first_number) do
      fact = -> (number) do
        (1..number).reduce(:*)
      end

      -> (second_number) do
        first_number_fact = fact.(first_number)
        second_number_fact = fact.(second_number)
        first_number_fact / ( second_number_fact * fact.(first_number - second_number) )
      end
    end
  end
end





