# frozen_string_literal: true

require 'spec_helper'
require './challenges/05_valid_words_checker'

describe '05: Valid words checker' do
  it 'detects if word is valid' do
    expect(
      valid_word?(
        "orange", %w(e n g a r o)
      )
    ).to be_truthy

    expect(
      valid_word?(
        "ferguson", %w(u r n o s g f e r a n g o)
      )
    ).to be_truthy
  end

  it 'detects if word is not valid' do
    expect(
      valid_word?(
        "mister", %w(i n t e r s)
      )
    ).to be_falsey

    expect(
      valid_word?(
        "bryan", %w(a r g t p i n y x w z)
      )
    ).to be_falsey
  end

  private

  def valid_word?(word, characters)
    ValidWordsChecker.new(
      word, characters
    ).valid?
  end
end
