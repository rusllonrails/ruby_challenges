# frozen_string_literal: true

#
# 10: Factorial Function
#
# BRIEF:
#
#   Write simple factorial function.
#
# EXAMPLES:
#
# FactorialFunction.new(1).generate
#
#   => 1
#
# FactorialFunction.new(2).generate
#
#   => 2
#
# FactorialFunction.new(5).generate
#
#   => 120
#

class FactorialFunction

  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def generate
    (1..number).inject(:*)
  end
end
