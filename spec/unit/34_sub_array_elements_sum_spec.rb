# frozen_string_literal: true

require 'spec_helper'
require './challenges/34_sub_array_elements_sum'

#
# 34: Sub-array elements sum
#
describe ::SubArrayElementsSum do
  subject do
    if defined?(default_number)
      described_class.new(
        array, default_number
      ).sum
    else
      described_class.new(array).sum
    end
  end

  context '[[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]] without default_number' do
    let(:array) do
      [[3, 2, 1, 0], [4, 6, 5, 3, 2], [9, 8, 7, 4]]
    end
    let(:expected_sum) { 16 }

    it { is_expected.to be(expected_sum) }
  end

  context '[[3], [4, 6, 5, 3, 2], [9, 8, 7, 4]] without default_number' do
    let(:array) do
      [[3], [4, 6, 5, 3, 2], [9, 8, 7, 4]]
    end
    let(:expected_sum) { 15 }

    it { is_expected.to be(expected_sum) }
  end

  context '[[3, 2, 1, 0], [4, 6, 5, 3, 2], []] without default_number' do
    let(:array) do
      [[3, 2, 1, 0], [4, 6, 5, 3, 2], []]
    end
    let(:expected_sum) { 7 }

    it { is_expected.to be(expected_sum) }
  end

  context '[[3, 2, 1, 0], [4, 6, 5, 3, 2], []] without default_number' do
    let(:array) do
      [[3, 2, 1, 0], [4, 6, 5, 3, 2], []]
    end
    let(:default_number) { 5 }
    let(:expected_sum) { 12 }

    it { is_expected.to be(expected_sum) }
  end

  context '[[3, 2], [4], []] without default_number' do
    let(:array) do
      [[3, 2], [4], []]
    end
    let(:expected_sum) { 0 }

    it { is_expected.to be(expected_sum) }
  end
end
