# frozen_string_literal: true

require 'spec_helper.rb'
require './challenges/06_palindromic_primes.rb'

describe '06: Palindromic Primes generation' do
  it 'returns first 5 palindromic primes' do
    expect(
      generate(5)
    ).to match_array([2, 3, 5, 7, 11])
  end

  it 'returns first 7 palindromic primes' do
    expect(
      generate(7)
    ).to match_array([2, 3, 5, 7, 11, 101, 131])
  end

  it 'returns first 10 palindromic primes' do
    expect(
      generate(10)
    ).to match_array([2, 3, 5, 7, 11, 101, 131, 151, 181, 191])
  end

  private

  def generate(n)
    PalindromicPrimes.new(n).generate
  end
end
