# frozen_string_literal: true

require 'spec_helper'
require './challenges/08_procs_blocks_lambdas'

describe '08: Procs Blocks and Lambdas' do

  let(:test_instance) do
    ProcsBlocksAndLambdas.new
  end

  describe 'Procs vs Lambdas' do
    describe 'Diff 1: Handling of return statements' do
      it 'shows that lambda exist from Closure, not from method which called Proc' do
        expect(
          test_instance.lambda_in_return
        ).to be('few')
      end

      it 'shows that proc exists from method which called Proc' do
        expect(
          test_instance.proc_in_return
        ).to be_nil
      end
    end

    describe 'Diff 2: Handling of arguments' do
      it 'shows that proc does not care about number of arguments' do
        expect(
          test_instance.proc_in_wrong_number_of_args
        ).to be_eql("Jenny and Bill")
      end

      it 'shows that lambda raises an exception if number of arguments is not as declarated' do
        expect {
          test_instance.lambdas_in_wrong_number_of_args
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'Blocks VS Procs/Lambdas' do
    describe 'Passing of procs and blocks into functions' do
      it 'shows that you can pass multiple procs/lambdas as arguments of functions' do
        expect(
          test_instance.you_can_pass_many_procs_lambdas_to_functions
        ).to be('yes, you can!')
      end
    end
  end
end

