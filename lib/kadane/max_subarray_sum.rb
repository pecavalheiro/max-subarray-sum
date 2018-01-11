# frozen_string_literal: true

module Kadane
  # Custom version of Kadane's Algorithm to find maximum subarray sum indexes
  class MaxSubarraySum
    attr_accessor :array

    def initialize(array)
      self.array = array
      @best_so_far = 0
      @best_now = 0
      @best_start_index_so_far = -1
      @best_stop_index_so_far = -1
      @best_start_index_now = -1
    end

    def subarray_indexes
      return nil unless valid_array?
      return max_number_coordinates if all_negative?
      process_array
      [@best_start_index_so_far, @best_stop_index_so_far]
    end

    private

    def process_array
      array_positions.each do |i|
        value = @best_now + array[i]
        if value.positive?
          @best_start_index_now = i if @best_now.zero?
          @best_now = value
        else
          @best_now = 0
        end
        next unless @best_now > @best_so_far
        update_best_indexes(i)
      end
    end

    def update_best_indexes(current_index)
      @best_so_far = @best_now
      @best_stop_index_so_far = current_index
      @best_start_index_so_far = @best_start_index_now
    end

    def array_positions
      (0..array.length - 1)
    end

    def max_number_coordinates
      index = array.each_with_index.max[1]
      [index, index]
    end

    def all_negative?
      array.all?(&:negative?)
    end

    def valid_array?
      return false unless array.is_a? Array
      return false if array.empty?
      true if array.all? { |i| i.is_a? Integer }
    end
  end
end
