# frozen_string_literal: true

require 'spec_helper'
require './challenges/18_multiple_of_three_and_five'

describe '18: Multiples of 3 or 5' do
  it 'allows to get the sum of all the multiples of 3 or 5 below the number passed in' do
    expect(
      Multiples.new(10).run
    ).to be(23)

    expect(
      Multiples.new(20).run
    ).to be(78)

    expect(
      Multiples.new(200).run
    ).to be(9168)
  end
end
