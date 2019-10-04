# frozen_string_literal: true

require 'spec_helper'
require './challenges/29_domain_specific_language'

#
# 28: Own Struct Class
#
describe ::Arbre::Context do
  let(:h2_text) { 'Why is Arbre awesome?' }
  let(:h2_html) { "<h2>#{h2_text}</h2>" }

  let(:p_text) { 'Some paragraph' }
  let(:p_html) { "<p>#{p_text}</p>" }

  let(:ul_id) { 'nav' }
  let(:ul_css_class) { 'list' }
  let(:li_first_text) { 'The DOM is implemented in ruby' }
  let(:li_second_text) { 'You can create object oriented views' }
  let(:li_third_text) { 'No templates' }

  let(:ul_html) do
    "<ul id='#{ul_id}' class='#{ul_css_class}'>
    <li>#{li_first_text}</li>
    <li>#{li_second_text}</li>
    <li>#{li_third_text}</li>
    </ul>".strip
          .gsub(/\s+/, " ")
          .delete(' ')
  end

  let(:renderred_html) do
    "<h2>#{h2_text}</h2>
    <ul id='#{ul_id}' class='#{ul_css_class}'>
    <li>#{li_first_text}</li>
    <li>#{li_second_text}</li>
    <li>#{li_third_text}</li>
    </ul>
    <p>#{p_text}</p>".strip
          .gsub(/\s+/, " ")
          .delete(' ')
  end

  describe '#h2' do
    subject do
      described_class.new do
        h2 'Why is Arbre awesome?'
      end.render
    end

    it { is_expected.to eq(h2_html) }
  end

  describe '#p' do
    subject do
      described_class.new do
        p 'Some paragraph'
      end.render
    end

    it { is_expected.to eq(p_html) }
  end

  describe '#ul' do
    subject do
      described_class.new do
        ul id: 'nav', class: 'list' do
          li 'The DOM is implemented in ruby'
          li 'You can create object oriented views'
          li 'No templates'
        end
      end.render.delete(' ')
    end

    it { is_expected.to eq(ul_html) }
  end

  describe '#render' do
    subject do
      described_class.new do
        h2 'Why is Arbre awesome?'

        ul id: 'nav', class: 'list' do
          li 'The DOM is implemented in ruby'
          li 'You can create object oriented views'
          li 'No templates'
        end

        p 'Some paragraph'
      end.render.delete(' ')
    end

    it { is_expected.to eq(renderred_html) }
  end
end
