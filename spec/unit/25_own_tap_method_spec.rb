# frozen_string_literal: true

require 'spec_helper'
require './challenges/25_own_tap_method'

describe '25: Own #my_tap method' do
  it 'allows to debug chain of methods' do
    res = [1, 2, 3].tap { |x| x * 2 }
                   .select { |x| x > 1 }
                   .my_tap { |x| x * 3 }
                   .select { |x| x < 3 }
                   .tap { |x| x }

    expect(
      res
    ).to match_array(
      2
    )
  end
end
