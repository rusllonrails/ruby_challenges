# frozen_string_literal: true

require 'spec_helper'
require './challenges/28_own_struct_class'

#
# 28: Own Struct Class
#
describe ::OwnStruct do
  let(:id) { 1 }
  let(:title) { 'kiwi' }
  let(:color) { 'green' }

  subject do
    product_klass = described_class.new(:id, :title, :color) do
      def title_and_color
        "#{title} with '#{color}'"
      end
    end

    product_klass.new(id, title, color)
  end

  describe 'virtual attributes' do
    context 'getter' do
      subject { super().title }

      it { is_expected.to eq(title) }
    end

    context 'setter' do
      let(:new_title) { 'fresh kiwi' }

      subject do
        rec = super()
        rec.title = new_title
        rec.title
      end

      it { is_expected.to eq(new_title) }
    end
  end

  describe 'hash helper methods' do
    context '[] getter' do
      subject { super()[:title] }

      it { is_expected.to eq(title) }
    end

    context '[]= setter' do
      let(:new_title) { 'outdated kiwi' }

      subject {
        rec = super()
        rec[:title] = new_title
        rec[:title]
      }

      it { is_expected.to eq(new_title) }
    end
  end

  describe 'methods added in class via passing of block to initialization method' do
    let(:right_title_and_color) { "#{title} with '#{color}'" }

    subject do
      super().title_and_color
    end

    it { is_expected.to eq(right_title_and_color) }
  end
end
