# frozen_string_literal: true

#
# 27: Permutations
#
# BRIEF:
#
#   You have to create all permutations of an input string and remove duplicates, if present.
#   This means, you have to shuffle all letters from the input in all possible orders.
#
# EXAMPLES:
#
#   PossibleCombinations.new('a').detect
#     => ['a']
#
#   PossibleCombinations.new('ab').detect
#     => ['ab', 'ba']
#
#   PossibleCombinations.new('aabb').detect
#     => ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
#

class PossibleCombinations

  attr_reader :letters
  private :letters

  def initialize(letters)
    @letters = letters.chars
  end

  def detect
    return letters if letters.size == 1

    @res = [letters]

    source_list = letters.clone
    fetch_replacement_combinations(source_list)

    letters.size.times do |i|
      fetch_replacement_combinations(
        source_list.rotate(i + 1)
      )
    end

    fetch_rotated_combinations

    formatted_result
  end

  private

  def fetch_replacement_combinations(source_list)
    source_list.each_with_index do |a, a_index|
      source_list.each_with_index do |b, b_index|
        next if a_index == b_index

        list = source_list.clone
        list[a_index] = b
        list[b_index] = a

        @res << list
      end
    end
  end

  def fetch_rotated_combinations
    rotated_combinations = []

    @res.map do |combination|
      letters.size.times do |i|
        rotated_combinations << combination.rotate(i + 1)
      end
    end

    @res += rotated_combinations
  end

  def formatted_result
    @res.uniq.map do |combination|
      combination.join('')
    end.sort
  end
end
