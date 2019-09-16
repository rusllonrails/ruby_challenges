# frozen_string_literal: true

require 'spec_helper.rb'
require './challenges/04_find_duplicates.rb'

describe '04: Find duplicates' do
  it 'detects duplicates in array' do
    expect(
      duplicates(
        [1,3,2,4,2,5,6,9,4,4,8,7,9]
      )
    ).to match_array([2,4,9])
  end

  private

  def duplicates(array)
    FindDuplicates.new(
      array
    ).duplicates
  end
end
