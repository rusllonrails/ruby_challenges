# frozen_string_literal: true

require 'spec_helper.rb'
require './samples/sequence.rb'

describe 'My Enumerable Module' do
  include_context 'with sequence'

  it 'allows to map sequence' do
    res = sequence.map { |x| x + 1 }

    expect(res).to match_array(
      [1, 6, 11, 16, 21]
    )
  end

  it 'allows to iterate sequence via #each' do
    sum = 0

    res = sequence.each do |element|
      sum += element + 2
    end

    # Sum should be:
    #
    # (0 + 2) + (5 + 2) + (10 + 2) + (15 + 2) + (20 + 2) = 60
    #
    expect(sum).to be_eql(60)

    #
    # Sequence#each should return iterating range
    #
    # 0..4
    #
    expect(res).to match_array(0..4)
  end

  it 'allows to select elements' do
    res = sequence.select { |x| x > 10 }

    expect(res).to match_array(
      [15, 20]
    )

    res = sequence.select(&:even?)

    expect(res).to match_array(
      [0, 10, 20]
    )

    res = sequence.select(&:odd?)

    expect(res).to match_array(
      [5, 15]
    )
  end
end
