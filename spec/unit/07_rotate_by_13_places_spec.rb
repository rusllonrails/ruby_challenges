# frozen_string_literal: true

require 'spec_helper.rb'
require './challenges/07_rotate_by_13_places.rb'

describe '07: Rotate by 13 places (ROT13)' do
  let(:original_array) do
    ['Why did the chicken cross the road?', 'Gb trg gb gur bgure fvqr!']
  end

  let(:converted_array) do
    ['Jul qvq gur puvpxra pebff gur ebnq?', 'To get to the other side!']
  end

  it 'should convert strings to ROT13 strings' do
    expect(
      RotateBy13Places.new(original_array).to_rot_13
    ).to match_array(
      converted_array
    )
  end
end
