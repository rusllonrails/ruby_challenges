# frozen_string_literal: true

#
# 31: Queue Time Counter
#
# SOURCE: https://www.codewars.com/kata/queue-time-counter/train/ruby
#
# BRIEF:
#
#   You managed to send your friend to queue for tickets in your stead, but there is a catch:
#   he will get there only if you tell him how much that is going to take.
#
#   And everybody can only take one ticket at a time, then they go back
#   in the last position of the queue if they need more (or go home if they are fine).
#
#   Each ticket takes one minutes to emit, the queue is well disciplined, Brit-style,
#   and so it moves smoothly, with no waste of time.
#
#   You will be given an array/list/vector with all the people queuing and
#   the initial position of your buddy, so for example:
#
#   knowing that your friend is in the third position
#   (that we will consider equal to the index, 2: he is the guy that wants 3 tickets!) and
#   the initial queue is [2, 5, 3, 4, 6].
#
#   The first dude gets his ticket and the queue goes now like this [5, 3, 4, 6, 1],
#   then [3, 4, 6, 1, 4] and so on. In the end, our buddy will be queuing for 12 minutes, true story!
#
#   Build a function to compute it, resting assured that
#   only positive integers are going to be there and you will be always given a valid index;
#   but we also want to go to pretty popular events,
#   so be ready for big queues with people getting plenty of tickets.
#
# EXAMPLES:
#
#   ::QueueTimeCounter.new([2, 5, 3, 6, 4], 0).queue_time
#     => 6
#
#   ::QueueTimeCounter.new([2, 5, 3, 6, 4], 1).queue_time
#     => 18
#
#   ::QueueTimeCounter.new([2, 5, 3, 6, 4], 2).queue_time
#     => 12
#
#   ::QueueTimeCounter.new([2, 5, 3, 6, 4], 3).queue_time
#     => 20
#
#   ::QueueTimeCounter.new([2, 5, 3, 6, 4], 4).queue_time
#     => 17
#

class QueueTimeCounter

  OUR_MARK = 'our'.freeze
  OTHERS_MARK = 'others'.freeze

  attr_reader :queuers, :position
  private :queuers, :position

  def initialize(queuers, position)
    @queuers = queuers
    @position = position
  end

  def queue_time
    total_minutes_took = 0
    tickets_to_buy = queuers[position]

    marked_queuers = queuers.map.with_index do |queuer, index|
      position == index ? [OUR_MARK, queuer] : [OTHERS_MARK, queuer]
    end

    while tickets_to_buy > 0 do
      first_in_queue = marked_queuers[0]
      first_in_queue[1] -= 1

      if first_in_queue[1] < 1
        marked_queuers = marked_queuers[1..-1]
      else
        marked_queuers.rotate!(1)
      end

      tickets_to_buy -= 1 if first_in_queue[0] == OUR_MARK
      total_minutes_took += 1
    end

    total_minutes_took
  end
end
