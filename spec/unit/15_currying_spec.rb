# frozen_string_literal: true

require 'spec_helper'
require './challenges/15_currying'

describe '15: Curry Function' do
  it 'allows to pass parameters separatelly' do
    f1 = CurryFunction.sum.curry.(2)
    f2 = f1.curry.(3)

    expect(
      f2.(5)
    ).to be(10)
  end
end
