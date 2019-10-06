# frozen_string_literal: true

require 'spec_helper'
require './challenges/30_alphabetical_addition'

#
# 30: Alphabetical Addition
#
describe ::AlphabeticalAddition do
  subject { described_class.new(*letters) }

  describe '#letter_detected' do
    context 'a, b, c' do
      subject { super().letter_detected }

      let(:letters) { ['a', 'b', 'c'] }
      let(:letter_detected) { 'f' }

      it { is_expected.to eq(letter_detected) }
    end

    context 'a, b' do
      subject { super().letter_detected }

      let(:letters) { ['a', 'b'] }
      let(:letter_detected) { 'c' }

      it { is_expected.to eq(letter_detected) }
    end

    context 'z' do
      subject { super().letter_detected }

      let(:letters) { ['z'] }
      let(:letter_detected) { 'z' }

      it { is_expected.to eq(letter_detected) }
    end

    context 'z, a' do
      subject { super().letter_detected }

      let(:letters) { ['z', 'a'] }
      let(:letter_detected) { 'a' }

      it { is_expected.to eq(letter_detected) }
    end

    context 'y, c, b' do
      subject { super().letter_detected }

      let(:letters) { ['y', 'c', 'b'] }
      let(:letter_detected) { 'd' }

      it { is_expected.to eq(letter_detected) }
    end

    context 'nothing' do
      subject { super().letter_detected }

      let(:letters) { nil }
      let(:letter_detected) { 'z' }

      it { is_expected.to eq(letter_detected) }
    end
  end
end
