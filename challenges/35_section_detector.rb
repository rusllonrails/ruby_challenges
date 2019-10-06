# frozen_string_literal: true

#
# 35: Section detector
#
# SOURCE: https://www.codewars.com/kata/which-section-did-you-scroll-to/train/ruby
#
# BRIEF:
#
#   Your website is divided vertically in sections, and each can be of different size (height).
#   You need to establish the section index (starting at 0) you are at, given the scrollY and
#   sizes of all sections.
#
#   Sections start with 0, so if first section is 200 high,
#   it takes 0-199 "pixels" and second starts at 200.
#
#   For example:
#
#   getSectionIdFromScroll( 300, [300,200,400,600,100] )
#   will output number 1 as it's the second section.
#
#   getSectionIdFromScroll( 1600, [300,200,400,600,100] )
#   will output number -1 as it's past last section.
#
#   Given the scrollY integer (always non-negative) and an array of non-negative integers
#   (with at least one element), calculate the index (starting at 0) or -1 if scrollY falls
#   beyond last section (indication of an error).
#
# EXAMPLES:
#
#   ::SectionDetector.new(299, [300, 200, 400, 600, 100])
#     => 0
#
#   ::SectionDetector.new(300, [300, 200, 400, 600, 100])
#     => 1
#
#   ::SectionDetector.new(1600, [300, 200, 400, 600, 100])
#     => -1
#

class SectionDetector

  attr_reader :point, :sections
  private :point, :sections

  def initialize(point, sections)
    @point = point
    @sections = sections
  end

  def section_position
    section_ranges.select do |index, section_range|
      return index if section_range.include?(point)
    end

    -1
  end

  private

  def section_ranges
    ranges = [ (0...sections.first).to_a ]

    sections[1..-1].map.with_index do |section_height, index|
      section_start_point = ranges.last.last + 1
      section_end_point = section_start_point + section_height

      ranges << (section_start_point...section_end_point).to_a
    end

    ranges.map.with_index do |range, index|
      [ index, range ]
    end
  end
end
