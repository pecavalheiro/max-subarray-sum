# frozen_string_literal: true

require 'csv'
require File.dirname(__FILE__) + '/lib/kadane/max_subarray_sum'

string_converter = ->(field, _) { field.strip.to_i }

CSV.foreach('input.csv', converters: [string_converter]).each do |row|
  indexes = Kadane::MaxSubarraySum.new(row).subarray_indexes
  puts "Input: #{row}"
  puts "Max Subarray Sum Indexes: #{indexes}\n\n"
end
