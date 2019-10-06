# frozen_string_literal: true

require 'spec_helper'
require './challenges/35_section_detector'

#
# 35: Section detector
#
describe ::SectionDetector do
  subject do
    described_class.new(
      point, sections
    ).section_position
  end

  context '299, [300, 200, 400, 600, 100]' do
    let(:point) { 299 }
    let(:sections) { [300, 200, 400, 600, 100] }

    it { is_expected.to be(0) }
  end

  context '300, [300, 200, 400, 600, 100]' do
    let(:point) { 300 }
    let(:sections) { [300, 200, 400, 600, 100] }

    it { is_expected.to be(1) }
  end

  context '1600, [300, 200, 400, 600, 100]' do
    let(:point) { 1600 }
    let(:sections) { [300, 200, 400, 600, 100] }

    it { is_expected.to be(-1) }
  end
end
