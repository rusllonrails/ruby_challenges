# frozen_string_literal: true

#
# 07: Rotate by 13 places (ROT13)
#
# BRIEF:
#
#   ROT13 ('rotate by 13 places', sometimes hyphenated ROT-13) is a simple letter substitution cipher
#   that replaces a letter with the 13th letter after it, in the alphabet.
#
#   ROT13 is a special case of the Caesar cipher which was developed in ancient Rome.
#
#   Example:
#
#     To get to the other side! -> Gb trg gb gur bgure fvqr!
#
# SO THE TASK IS:
#
#   Write a method which takes an array of strings (containing secret enemy message bits!)
#   and decodes its elements using ROT13 cipher system;
#
#   Returning an array containing the final messages.
#
# EXAMPLE:
#
# RotateBy13Places.new(
#   ['Why did the chicken cross the road?', 'Gb trg gb gur bgure fvqr!']
# ).to_rot_13
#
#   => ['Jul qvq gur puvpxra pebff gur ebnq?', 'To get to the other side!']
#

class RotateBy13Places

  ROT13_PLACES = 13
  AZ_UPPER = ('A'..'Z').to_a
  AZ_LOWER = ('a'..'z').to_a

  attr_reader :array_of_sentences
  private :array_of_sentences

  def initialize(array_of_sentences)
    @array_of_sentences = array_of_sentences
  end

  def to_rot_13
    array_of_sentences.map do |sentence|
      sentence.chars.map do |letter|
        if is_upper?(letter)
          convert_to_rot_13(letter, :upper)
        elsif is_lower?(letter)
          convert_to_rot_13(letter, :lower)
        else
          letter
        end
      end.join
    end
  end

  private

  def convert_to_rot_13(letter, list_name)
    list = list_name == :upper ? AZ_UPPER : AZ_LOWER
    current_position = list.index(letter)

    list.rotate(ROT13_PLACES)[current_position]
  end

  def is_upper?(letter)
    AZ_UPPER.include?(letter)
  end

  def is_lower?(letter)
    AZ_LOWER.include?(letter)
  end
end
