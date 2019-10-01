# frozen_string_literal: true

require 'spec_helper'
require './challenges/27_permutations'

describe '27: Permutations' do
  it 'returns all possible combinations for provided letters' do
    expect(
      detect('a')
    ).to match_array(
      ['a']
    )

    expect(
      detect('ab')
    ).to match_array(
      ['ab', 'ba']
    )

    expect(
      detect('aabb')
    ).to match_array(
      ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
    )

    expect(
      detect('abc')
    ).to match_array(
      ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']
    )
  end

  private

  def detect(str)
    PossibleCombinations.new(
      str
    ).detect
  end
end
