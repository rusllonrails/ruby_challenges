# frozen_string_literal: true

require 'spec_helper'
require './challenges/23_scramblies'

describe '23: Scramblies' do
  it 'checks if possible' do
    expect(
      possible?('rkqodlw', 'world')
    ).to be_truthy

    expect(
      possible?('cedewaraaossoqqyt', 'codewars')
    ).to be_truthy

    expect(
      possible?('katas', 'steak')
    ).to be_falsey

    expect(
      possible?('scriptjava', 'javascript')
    ).to be_truthy

    expect(
      possible?('scriptingjava', 'javascript')
    ).to be_truthy
  end

  private

  def possible?(stock, word)
    Scramble.new(
      stock, word
    ).possible?
  end
end
