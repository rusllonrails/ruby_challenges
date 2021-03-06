# frozen_string_literal: true

#
# 02: Simple Sortable module
#
# Image you do not have sort, max, min and reverse.
# Try implement own simple Sortable module for collection object.
#
# Methods todo:
#
# - sort by asc
# - sort by desc
# - max
# - min
# - avg
# - reverse
#

module MySortable
  def sort(compare_operator='>')
    list = collection

    for j in range
      for i in range
        current_item = list[i]
        next_item = list[i+1]

        if next_item && eval("current_item #{compare_operator} next_item")
         list[i] = next_item
         list[i+1] = current_item
        end
      end
    end

    list
  end

  def sort_desc
    sort("<")
  end

  def min
    sort[0]
  end

  def max
    sort_desc[0]
  end

  def avg
    list = collection
    list.reduce(:+).to_f / list.size
  end

  def reverse
    list = collection
    reversed_collection = []

    for i in range
      reversed_collection.unshift(list[i])
    end

    reversed_collection
  end

  private

  def range
    (0..(collection.size - 1))
  end
end
