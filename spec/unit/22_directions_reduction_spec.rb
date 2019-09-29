# frozen_string_literal: true

require 'spec_helper'
require './challenges/22_directions_reduction'

describe '22: Directions Reduction' do
  it 'detects shorter way' do
    expect(
      find(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])
    ).to match_array(
      ["WEST"]
    )

    expect(
      find(["NORTH", "WEST", "SOUTH", "EAST"])
    ).to match_array(
      ["NORTH", "WEST", "SOUTH", "EAST"]
    )
  end

  private

  def find(array_of_directions)
    FindBetterWay.new(
      array_of_directions
    ).run
  end
end
