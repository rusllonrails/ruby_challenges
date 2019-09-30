# frozen_string_literal: true

require 'spec_helper'
require './challenges/24_own_active_support_concern'

describe '24: Own ActiveSupport::Concern' do
  let(:pet) do
    Pet.new
  end

  it 'provides included imitation' do
    expect(
      pet.class.instance_methods(false)
    ).to match_array(
      [:bar=, :foo, :bar, :foo=]
    )
  end

  it 'provides class_methods imitation' do
    expect(
      pet.class.methods
    ).to include(
      :test_class_method
    )
  end
end
