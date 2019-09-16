# frozen_string_literal: true

require 'spec_helper.rb'
require './challenges/03_sequence_generator.rb'

describe '03: Sequence generator' do
  it 'allows to generate sequence' do
    expect(
      generate(0, 1, 5)
    ).to match_array(
      [0, 1, 2, 3, 4]
    )
  end

  it 'allows to generate sequence with custom step' do
    expect(
      generate(0, 3, 4)
    ).to match_array(
      [0, 3, 6, 9]
    )
  end

  it 'allows to start sequence with custom number' do
    expect(
      generate(15, 5, 5)
    ).to match_array(
      [15, 20, 25, 30, 35]
    )
  end

  private

  def generate(*settings)
    SequenceGenerator.new(
      *settings
    ).collection
  end
end
