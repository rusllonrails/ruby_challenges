# frozen_string_literal: true

require 'spec_helper'
require './challenges/31_queue_time_counter'

#
# 31: Queue Time Counter
#
describe ::QueueTimeCounter do
  subject { described_class.new(queuers, position) }

  context '2, 5, 3, 6, 4 with 0' do
    subject { super().queue_time }

    let(:queuers) { [2, 5, 3, 6, 4] }
    let(:position) { 0 }
    let(:queue_time) { 6 }

    it { is_expected.to be(queue_time) }
  end

  context '2, 5, 3, 6, 4 with 1' do
    subject { super().queue_time }

    let(:queuers) { [2, 5, 3, 6, 4] }
    let(:position) { 1 }
    let(:queue_time) { 18 }

    it { is_expected.to be(queue_time) }
  end

  context '2, 5, 3, 6, 4 with 2' do
    subject { super().queue_time }

    let(:queuers) { [2, 5, 3, 6, 4] }
    let(:position) { 2 }
    let(:queue_time) { 12 }

    it { is_expected.to be(queue_time) }
  end

  context '2, 5, 3, 6, 4 with 3' do
    subject { super().queue_time }

    let(:queuers) { [2, 5, 3, 6, 4] }
    let(:position) { 3 }
    let(:queue_time) { 20 }

    it { is_expected.to be(queue_time) }
  end

  context '2, 5, 3, 6, 4 with 4' do
    subject { super().queue_time }

    let(:queuers) { [2, 5, 3, 6, 4] }
    let(:position) { 4 }
    let(:queue_time) { 17 }

    it { is_expected.to be(queue_time) }
  end
end
