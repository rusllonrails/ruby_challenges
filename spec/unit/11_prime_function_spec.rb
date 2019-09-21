# frozen_string_literal: true

require 'spec_helper'
require './challenges/11_prime_function'

describe '11: Prime function' do
  it 'allows to check if number is prime or not' do
    expect(
      prime?(3)
    ).to be_truthy

    expect(
      prime?(7)
    ).to be_truthy

    expect(
      prime?(17)
    ).to be_truthy

    expect(
      prime?(22)
    ).to be_falsey
  end
end
