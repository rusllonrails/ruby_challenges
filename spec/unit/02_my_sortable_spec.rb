# frozen_string_literal: true

require 'spec_helper'
require './challenges/03_sequence_generator'

describe '02: My Sortable Module' do
  include_context 'with sequence'

  it 'allows to sort sequence' do
    res = sequence.sort

    expect(res).to match_array(
      [0, 5, 10, 15, 20]
    )
  end

  it 'allows to reverse sequence' do
    res = sequence.reverse

    expect(res).to match_array(
      [20, 15, 10, 5, 0]
    )
  end

  it 'allows to fetch max value' do
    expect(sequence.max).to be(20)
  end

  it 'allows to fetch min value' do
    expect(sequence.min).to be(0)
  end

  it 'allows to fetch average value' do
    expect(sequence.avg).to be(10.0)
  end
end
