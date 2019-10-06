# frozen_string_literal: true

#
# 32: Unique In Order
#
# SOURCE: https://www.codewars.com/kata/unique-in-order/train/ruby
#
# BRIEF:
#
#   Implement the function unique_in_order which takes as argument a sequence
#   and returns a list of items without any elements with the same value
#   next to each other and preserving the original order of elements.
#
# EXAMPLES:
#
#   ::UniqueInOrder.new('AAAABBBCCDAABBB').generate
#     => ['A', 'B', 'C', 'D', 'A', 'B']
#
#   ::UniqueInOrder.new('ABBCcAD').generate
#     => ['A', 'B', 'C', 'c', 'A', 'D']
#
#   ::UniqueInOrder.new([1, 2, 2, 3, 3]).generate
#     => [1, 2, 3]
#

class UniqueInOrder

  attr_reader :sequence
  private :sequence

  def initialize(sequence)
    @sequence = sequence.is_a?(String) ? sequence.chars : sequence
  end

  def generate
    unique_list = []

    sequence.each_with_index do |item, position|
      unless unique_list[-1] == item
        unique_list << item
      end
    end

    unique_list
  end
end
