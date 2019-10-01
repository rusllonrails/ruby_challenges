# frozen_string_literal: true

require 'spec_helper'
require './challenges/26_range_extraction'

describe '26: Range Extraction' do
  it 'returns a correctly formatted string in the range format' do
    expect(
      convert(
        [-21,-20,-19,-17,-15,2,3,4,5,21,45,65,66,67,70]
      )
    ).to be_eql(
      "-21--19,-17,-15,2-5,21,45,65-67,70"
    )

    expect(
      convert(
        [-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]
      )
    ).to be_eql(
      "-6,-3-1,3-5,7-11,14,15,17-20"
    )
  end

  private

  def convert(array)
    RangeExtraction.new(
      array
    ).convert
  end
end
