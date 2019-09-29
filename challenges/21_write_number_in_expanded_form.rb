# frozen_string_literal: true

#
# 21: Write a number in expanded form
#
# BRIEF:
#
#   You will be given a number and you will need to return it as a string in Expanded Form.
#
#   For example:
#
#   12 should return '10 + 2'
#   42 should return '40 + 2'
#   70304 should return '70000 + 300 + 4'
#
# NOTE:
#
#   All numbers will be whole numbers greater than 0.
#
# EXAMPLES:
#
#   NumberConverter.new(12).expanded_form
#     => '10 + 2'
#
#   NumberConverter.new(70304).expanded_form
#     => '70000 + 300 + 4'
#

class NumberConverter

  ZERO = "0".freeze

  attr_reader :number
  private :number

  def initialize(number)
    @number = number.to_s
  end

  def expanded_form
    get_part = -> (num) do
      zeros = ZERO * (num.size - 1)
      "#{num.chars.first}#{zeros}"
    end

    res = []

    while number.size > 0 do
      res << get_part.(number)

      @number = number[1..-1]

      while number.start_with?(ZERO)
        @number = number[1..-1]
      end
    end

    res.join(' + ')
  end
end
