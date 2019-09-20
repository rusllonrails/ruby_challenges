# frozen_string_literal: true

require 'spec_helper'
require './challenges/10_factorial_function'

describe '10: Factorial function' do
  it 'allows to get factorial value for number' do
    expect(
      generate(1)
    ).to be(1)

    expect(
      generate(2)
    ).to be(2)

    expect(
      generate(5)
    ).to be(120)
  end

  private

  def generate(number)
    FactorialFunction.new(
      number
    ).generate
  end
end
