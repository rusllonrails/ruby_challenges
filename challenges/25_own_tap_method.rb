# frozen_string_literal: true

#
# 25: Own '#tap' method
#
# BRIEF:
#
#   Imagine you don't have it implemented yet.
#   Create own #tap method.
#
# EXAMPLE:
#
#   class Object
#     include CustomTap
#   end
#
#   (1..10)                   .my_tap {|x| puts "original: #{x}" }
#      .to_a                  .my_tap {|x| puts "array:    #{x}" }
#      .select {|x| x.even? } .my_tap {|x| puts "evens:    #{x}" }
#      .map {|x| x*x }        .my_tap {|x| puts "squares:  #{x}" }
#

module CustomTap
  def my_tap
    yield self
    self
  end
end

class Object
  include CustomTap
end
