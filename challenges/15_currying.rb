# frozen_string_literal: true

#
# 15: Currying
#
# BRIEF:
#
#   Currying is a technique in which a function accepts N parameters and
#   turns it into a sequence of N functions, each of them take 1 parameter.
#
#   Write a curry function, which summarizing of 3 numbers.
#   Demostrate curry technique via Unit tests.
#
class CurryFunction
  def self.sum
    -> (x, y, z) do
      x + y + z
    end
  end
end
