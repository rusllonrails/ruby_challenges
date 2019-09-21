# frozen_string_literal: true

require 'spec_helper'
require './challenges/13_ncr_combination'

describe '13: nCr combination' do
  it 'allows to get nCr combination for 2 numbers' do
    expect(
      generate(4, 2)
    ).to be(6)

    expect(
      generate(5, 1)
    ).to be(5)

    expect(
      generate(5, 3)
    ).to be(10)
  end

  private

  def generate(first_number, second_number)
    combination_func = NcrCombination.new.generate

    ncr_proc = combination_func.(first_number)
    ncr_proc.(second_number)
  end
end
