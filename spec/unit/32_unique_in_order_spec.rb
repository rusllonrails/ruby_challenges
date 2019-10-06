# frozen_string_literal: true

require 'spec_helper'
require './challenges/32_unique_in_order'

#
# 32: Unique In Order
#
describe ::UniqueInOrder do
  subject { described_class.new(sequence).generate }

  context 'AAAABBBCCDAABBB' do
    let(:sequence) { 'AAAABBBCCDAABBB' }

    it { is_expected.to match_array(['A', 'B', 'C', 'D', 'A', 'B']) }
  end

  context 'ABBCcAD' do
    let(:sequence) { 'ABBCcAD' }

    it { is_expected.to match_array(['A', 'B', 'C', 'c', 'A', 'D']) }
  end

  context '1,2,2,3,3' do
    let(:sequence) { [1,2,2,3,3] }

    it { is_expected.to match_array([1,2,3]) }
  end
end
