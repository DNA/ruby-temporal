# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: >
#   Appropriate error thrown when argument cannot be converted to a valid string
#   for Calendar
# features: [BigInt, Symbol, Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Calendar < Minitest::Test
    {
      boolean: true,
      number: 1,
      bigint: (1 << 64) + 1,
      negative_number: -19_761_118,
      large_positive_number: 19_761_118,
      large_integer: 1_234_567_890,
      array: [],
      object: self,
      duration_instance: Temporal::Duration.new(0, 0, 0, 0, 0, 0, 0),
    }.each do |name, value|
      define_method("test_#{name}") do
        assert_raises(RangeError) do
          Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321, calendar_id: value)
        end
      end
    end
  end
end
