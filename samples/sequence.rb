require "./samples/01_my_enumerable.rb"

class Sequence
  include MyEnumerable

  attr_reader :start,
              :step,
              :length

  def initialize(start, step, length)
    @start = start
    @step = step
    @length = length
  end

  private

    def collection
      for i in scope_range
        step * i
      end
    end

    def scope_range
      start..(length - 1)
    end
end
