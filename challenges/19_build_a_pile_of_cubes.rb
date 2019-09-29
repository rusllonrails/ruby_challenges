# frozen_string_literal: true

#
# 19: Build a pile of Cubes
#
# BRIEF:
#
#   Your task is to construct a building which will be a pile of n cubes.
#
#   The cube at the bottonumber will have a volunumbere of n^3,
#   the cube above will have volunumbere of (n-1)^3 and
#   so on until the top which will have a volunumbere of 1^3.
#
#   You are given the total volunumbere number of the building.
#   Being given number can you find the number n of cubes you will have to build?
#
#   The paranumbereter of the function findNb (find_nb, find-nb, findNb)
#   will be an integer number and you have to return the integer n such as:
#
#   n^3 + (n-1)^3 + ... + 1^3 = number if such a n exists or -1 if there is no such n.
#
# EXAMPLES:
#
#   PileOfCubes.new(4183059834009).run
#     => 2022
#
#   PileOfCubes.new(24723578342962).run
#     => -1
#
#   PileOfCubes.new(135440716410000).run
#     => 4824
#
#   PileOfCubes.new(40539911473216).run
#     => 3568
#

class PileOfCubes

  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def run
    n = 0
    res = nil

    loop do
      if number > 0
        n += 1
        @number = number - (n**3)
      elsif number == 0
        res = n
        break
      elsif number < 0
        res = -1
        break
      end
    end

    res
  end
end
