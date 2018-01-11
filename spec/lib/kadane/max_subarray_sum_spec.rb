# frozen_string_literal: true

require 'spec_helper'
require File.dirname(__FILE__) + '/../../../lib/kadane/max_subarray_sum'

RSpec.shared_examples 'a KadaneAlgorithm' do |array, indexes|
  it "returns #{indexes} as max subarray indexes for #{array}" do
    expect(Kadane::MaxSubarraySum.new(array).subarray_indexes).to eq indexes
  end
end

describe Kadane::MaxSubarraySum do
  describe '#subarray_indexes' do
    context 'valid input' do
      context 'having only positive numbers' do
        it_behaves_like 'a KadaneAlgorithm', [[4, 5, 5, 7, 4, 1, 8, 6], [0, 7]]
      end
      context 'having only negative numbers' do
        it_behaves_like 'a KadaneAlgorithm', [[-2, -3, -6, -5, -1, -2, -4, -3],
                                              [4, 4]]
      end
      context 'subarray has only one position' do
        it_behaves_like 'a KadaneAlgorithm', [[2, 5, -8, -3, 8, -2, -9, 7],
                                              [4, 4]]
      end
      context 'subarray has only one number' do
        it_behaves_like 'a KadaneAlgorithm', [[2], [0, 0]]
      end
      context 'having both positive and negative numbers' do
        it_behaves_like 'a KadaneAlgorithm', [[-4, -3, 6, 6, -9, 4, -9, 8],
                                              [2, 3]]
      end
    end
    context 'invalid input' do
      context 'having float numbers' do
        it_behaves_like 'a KadaneAlgorithm', [[-4.9, -3, 6, 6, -9, 4, -9, 8],
                                              nil]
      end
      context 'array has characters' do
        it 'returns nil as result' do
          expect(Kadane::MaxSubarraySum.new(['a', 1, 23, 9]).subarray_indexes)
            .to eq nil
        end
      end
      context 'input is not an array' do
        it 'returns nil as result' do
          expect(Kadane::MaxSubarraySum.new('string').subarray_indexes)
            .to eq nil
        end
      end
    end
  end
end
