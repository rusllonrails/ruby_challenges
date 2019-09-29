# frozen_string_literal: true

require 'spec_helper'
require './challenges/20_highest_scoring_word'

describe '20: Highest Scoring Word' do
  it 'allows to fetch word with highest score' do
    expect(
      find_score('man i need a taxi up to ubud')
    ).to eq('taxi')

    expect(
      find_score('what time are we climbing up the volcano')
    ).to eq('volcano')

    expect(
      find_score('take me to semynak')
    ).to eq('semynak')

    expect(
      find_score('aaa b')
    ).to eq('aaa')
  end

  private

  def find_score(words_str)
    HighestScoringWord.new(words_str).find
  end
end
