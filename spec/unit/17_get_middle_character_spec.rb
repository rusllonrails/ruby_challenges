# frozen_string_literal: true

require 'spec_helper'
require './challenges/17_get_middle_character'

describe '17: Get the Middle Character' do
  it 'allows to detect middle char for number of word letters is odd' do
    expect(
      GetMiddleCharacter.new('test').run
    ).to be_eql('es')

    expect(
      GetMiddleCharacter.new('congratulation').run
    ).to be_eql('tu')
  end

  it 'allows to detect middle char for number of word letters is even' do
    expect(
      GetMiddleCharacter.new('testing').run
    ).to be_eql('t')

    expect(
      GetMiddleCharacter.new('manufacturing').run
    ).to be_eql('c')
  end
end
