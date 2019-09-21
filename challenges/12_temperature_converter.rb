# frozen_string_literal: true

#
# 12: Temperature Converter
#
# BRIEF:
#
#   Task is to write a method that helps in temperature conversion.
#   The method will receive a number as an input (temperature),
#   a named parameter input_scale (scale for input temperature),
#   and an optional parameter output_scale (output temperature scale,
#   defaults to Celsius) and return the converted temperature.
#
#   It should perform interconversion between Celsius, Fahrenheit and Kelvin scale.
#
# EXAMPLES:
#
#
# TemperatureConverter.new(0, input_scale: 'celsius', output_scale: 'kelvin').convert
#
#   => 273.15
#
# TemperatureConverter.new(0, input_scale: 'celsius', output_scale: 'fahrenheit').convert
#
#   => 32.0
#

class TemperatureConverter

  attr_reader :temperature, :input_scale, :output_scale
  private :temperature, :input_scale, :output_scale

  def initialize(temperature, input_scale: 'kelvin', output_scale: 'celsius')
    @temperature = temperature.to_f
    @input_scale = input_scale
    @output_scale = output_scale
  end

  class KelvinToCelsius
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      @temperature - 273.15
    end
  end

  class KelvinToFahrenheit
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      ((@temperature - 273.15) * (9.to_f / 5)) + 32
    end
  end

  class CelsiusToKelvin
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      @temperature + 273.15
    end
  end

  class CelsiusToFahrenheit
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      (@temperature * (9.to_f / 5)) + 32
    end
  end

  class FahrenheitToKelvin
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      ((@temperature - 32) * (5.to_f / 9)) + 273.15
    end
  end

  class FahrenheitToCelsius
    def initialize(temperature)
      @temperature = temperature
    end

    def convert
      (@temperature - 32) * (5.to_f / 9)
    end
  end

  def convert
    converter_sub_klass.new(temperature).convert
  end

  private

  def converter_sub_klass
    Kernel.const_get(
      "::TemperatureConverter::#{input_scale.capitalize}To#{output_scale.capitalize}"
    )
  end
end
