# frozen_string_literal: true

require 'spec_helper'
require './challenges/14_fibonacci_sequence_generator'

describe '14: Fibonacci Sequence Generator' do
  it 'allows to generate sequence' do
    expect(
      generate(1)
    ).to match_array(
      [0]
    )

    expect(
      generate(2)
    ).to match_array(
      [0, 1]
    )

    expect(
      generate(6)
    ).to match_array(
      [0, 1, 1, 2, 3, 5]
    )

    expect(
      generate(11)
    ).to match_array(
      [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    )
  end

  private

  def generate(number)
    FibonacciSequence.new(number).generate
  end
end
