# frozen_string_literal: true

#
# 22: Directions Reduction
#
# BRIEF:
#
#   Once upon a time, on a way through the old wild west,…
#   a man was given directions to go from one point to another.
#
#   The directions were "NORTH", "SOUTH", "WEST", "EAST".
#   Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too.
#
#   Going to one direction and coming back the opposite direction is a needless effort.
#   Since this is the wild west, with dreadfull weather and not much water,
#   it's important to save yourself some energy, otherwise you might die of thirst!
#
#   How I crossed the desert the smart way.
#   The directions given to the man are,
#
#   for example, the following (depending on the language):
#
#   ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
#
#   You can immediatly see that going "NORTH" and then "SOUTH" is not reasonable,
#   better stay to the same place!
#
#   So the task is to give to the man a simplified version of the plan.
#   A better plan in this case is simply:
#
#   ["WEST"]
#
#  TASK:
#
#    Write a function dirReduc which will take an array of strings and
#    returns an array of strings with the needless directions removed
#    (W<->E or S<->N side by side).
#

class FindBetterWay

  OPPOSITES = {
    "NORTH" => "SOUTH",
    "SOUTH" => "NORTH",
    "EAST" => "WEST",
    "WEST" => "EAST"
  }.freeze

  SYSTEM_ARGS = [
    :array_of_directions,
    :previous_way,
    :last_way
  ].freeze

  attr_reader *SYSTEM_ARGS
  private *SYSTEM_ARGS

  def initialize(array_of_directions)
    @array_of_directions = array_of_directions
    @previous_way = array_of_directions
  end

  def run
    while last_two_way_are_not_match? do
      simplify_way
    end

    last_way
  end

  private

  def simplify_way
    @previous_way = last_way || array_of_directions

    shorter_way = []
    number_of_directions = previous_way.size
    position_to_skip = nil

    previous_way.each_with_index do |current_direction, position|
      next if position_to_skip == position
      next_position = position + 1

      if next_position < number_of_directions
        next_direction = previous_way[next_position]

        if opposites?(current_direction, next_direction)
          position_to_skip = next_position
        else
          shorter_way << current_direction
        end
      else
        shorter_way << current_direction
      end
    end

    @last_way = shorter_way
  end

  def last_two_way_are_not_match?
    previous_way != last_way
  end

  def opposites?(current_direction, next_direction)
    OPPOSITES[current_direction] == next_direction ||
    OPPOSITES[next_direction] == current_direction
  end
end
