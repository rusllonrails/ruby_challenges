# frozen_string_literal: true

#
# 08: Procs, Blocks and Lambdas
#
# BRIEF:
#
#   Write a Class with methods,
#   which demonstrating difference between Procs, Blocks and Lambdas.
#

class ProcsBlocksAndLambdas
  #
  # 1: Procs VS Lambdas: Handling of return statements.
  #
  # Lambdas handle return the way you’re used to — you exit out of the closure.
  #
  def lambda_in_return
    lambda_func = -> () {
      return
    }
    lambda_func.call

    "few"
  end

  #
  # Procs, on the other hand return from the method enclosing the Proc!
  #
  def proc_in_return
    proc_func = proc {
      return
    }
    proc_func.call

    "mew"
  end

  #
  # 2: Procs VS Lambdas: Handling of arguments.
  #
  # 'Proc' is short for 'procedure'.
  # Procs don’t strictly enforce the arguments you pass in,
  # which can be a good thing or a bad thing, depending on the way you look at it.
  #
  def proc_in_wrong_number_of_args
    proc_func = Proc.new do |a, b|
      "#{a} and #{b}"
    end

    proc_func.call
    proc_func.call(1, 2, 3)
    proc_func.call('Jenny', 'Bill')
  end

  #
  # Lambdas in this way function more like Ruby methods.
  # If you pass the wrong number of arguments into your Lambda, you’ll get an argument error.
  #
  def lambdas_in_wrong_number_of_args
    lambda_func = lambda do |a, b|
      "#{a} and #{b}"
    end

    lambda_func.call
    lambda_func.call(1, 2, 3)
    lambda_func.call('Jenny', 'Bill')
  end

  #
  # 3: Blocks VS Procs/Lambdas
  #
  # - Procs and Lambdas are objects, Block is not.
  # - Procs and Lambdas are both instances of Proc class.
  # - Blocks can not be assigned into variables, just can be passed as argument.
  # - You can't pass multiple blocks into function at the same time.
  # - You can pass multiple Procs or Lambdas into function at the same time.
  #

  class Cat
    def mew(p1, p2, l1, l2)
      p1.call(1, 2)
      p2.call

      l1.call(1, 2)
      l2.call('Jenny', 'Bill')
    end
  end

  def you_can_pass_many_procs_lambdas_to_functions
    proc_func = proc { |a, b| a + b }
    proc_func2 = Proc.new { "Cool!" }

    lambda_func = -> (a, b) { a + b }
    lambda_func2 = lambda do |a, b|
      "#{a} and #{b} are friends!"
    end

    Cat.new.mew(
      proc_func,
      proc_func2,
      lambda_func,
      lambda_func2
    )

    'yes, you can!'
  end
end
