# frozen_string_literal: true

require 'spec_helper'
require './challenges/16_digital_root'

describe '16: Digital root' do
  it 'allows to calculate digital root value' do
    expect(
      DigitalRoot.root(16)
    ).to be(7)

    expect(
      DigitalRoot.root(942)
    ).to be(6)

    expect(
      DigitalRoot.root(132189)
    ).to be(6)

    expect(
      DigitalRoot.root(493193)
    ).to be(2)
  end
end
