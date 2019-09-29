# frozen_string_literal: true

#
# 20: Highest Scoring Word
#
# BRIEF:
#
# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to its position in the alphabet:
#
#   a = 1, b = 2, c = 3 etc.
#
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
#
# All letters will be lowercase and all inputs will be valid.
#
# EXAMPLES:
#
#   HighestScoringWord.new('man i need a taxi up to ubud').find
#     => 'taxi'
#
#   HighestScoringWord.new('what time are we climbing up the volcano').find
#     => 'volcano'
#
#   HighestScoringWord.new('take me to semynak').find
#     => 'semynak'
#
#   HighestScoringWord.new('aaa b').find
#     => 'aaa'
#

class HighestScoringWord

  AZ = ('a'..'z').to_a.freeze

  attr_reader :words_string
  private :words_string

  def initialize(words_string)
    @words_string = words_string
  end

  def find
    words_collection = words_string.split(' ')
    words_with_scores = {}

    res = words_collection.map do |word|
      words_with_scores[word] = word.chars.map do |char|
        AZ.index(char) + 1
      end.sum
    end

    if words_with_scores.values.uniq.count == 1
      words_collection.first
    else
      words_with_scores.max_by { |k, v| v }[0]
    end
  end
end
