# frozen_string_literal: true

require 'spec_helper'
require './challenges/21_write_number_in_expanded_form'

describe '21: Write a number in expanded form' do
  it 'converts number to expanded form' do
    expect(
      convert(12)
    ).to be_eql('10 + 2')

    expect(
      convert(42)
    ).to be_eql('40 + 2')

    expect(
      convert(70304)
    ).to be_eql('70000 + 300 + 4')
  end

  private

  def convert(number)
    NumberConverter.new(
      number
    ).expanded_form
  end
end
