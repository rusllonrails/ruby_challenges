# frozen_string_literal: true

require 'spec_helper'
require './challenges/33_triangle_of_odd_numbers'

#
# 33: Triangle of Odd Numbers
#
describe ::TriangleOfOddNumbers do
  subject do
    described_class.new(
      triangle_position
    ).sum
  end

  context '1' do
    let(:triangle_position) { 1 }

    it { is_expected.to be(1) }
  end

  context '2' do
    let(:triangle_position) { 2 }

    it { is_expected.to be(8) }
  end

  context '13' do
    let(:triangle_position) { 13 }

    it { is_expected.to be(2197) }
  end

  context '19' do
    let(:triangle_position) { 19 }

    it { is_expected.to be(6859) }
  end

  context '41' do
    let(:triangle_position) { 41 }

    it { is_expected.to be(68921) }
  end
end
