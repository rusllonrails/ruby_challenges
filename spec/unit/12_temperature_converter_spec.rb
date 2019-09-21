# frozen_string_literal: true

require 'spec_helper'
require './challenges/12_temperature_converter'

describe '12: Temperature Converter' do
  it 'converts form kelvin to celsius' do
    expect(
      convert(10, 'kelvin', 'celsius')
    ).to be(-263.15)
  end

  it 'converts form kelvin to fahrenheit' do
    expect(
      convert(10, 'kelvin', 'fahrenheit')
    ).to be(-441.67)
  end

  it 'converts form celsius to kelvin' do
    expect(
      convert(10, 'celsius', 'kelvin')
    ).to be(283.15)
  end

  it 'converts form celsius to fahrenheit' do
    expect(
      convert(10, 'celsius', 'fahrenheit')
    ).to be(50.0)
  end

  it 'converts form fahrenheit to kelvin' do
    expect(
      convert(10, 'fahrenheit', 'kelvin')
    ).to be(260.93)
  end

  it 'converts form fahrenheit to celsius' do
    expect(
      convert(10, 'fahrenheit', 'celsius')
    ).to be(-12.22)
  end

  private

  def convert(value, input_scale, output_scale)
    TemperatureConverter.new(
      value, input_scale: input_scale, output_scale: output_scale
    ).convert
     .round(2)
  end
end
