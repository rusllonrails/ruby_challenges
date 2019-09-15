# frozen_string_literal: true

shared_context 'with sequence' do
  let(:sequence) do
    #
    # It will generate following sequence with 5 elements
    # starting from 0 and with step 5:
    #
    # [0, 5, 10, 15, 20]
    #
    SequenceGenerator.new(0, 5, 5)
  end
end
