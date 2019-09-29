# frozen_string_literal: true

require 'spec_helper'
require './challenges/19_build_a_pile_of_cubes'

describe '19: Build a pile of Cubes' do
  it 'allows to calculate pile of cubes' do
    expect(
      PileOfCubes.new(4183059834009).run
    ).to eql(2022)

    expect(
      PileOfCubes.new(24723578342962).run
    ).to eql(-1)

    expect(
      PileOfCubes.new(135440716410000).run
    ).to eql(4824)

    expect(
      PileOfCubes.new(40539911473216).run
    ).to eql(3568)
  end
end
