# frozen_string_literal: true

require "temporal/duration"
require_relative "../plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/calendar-wrong-type.js
#   esid: sec-temporal.plaindate
#   description: >
#     Appropriate error thrown when argument cannot be converted to a valid string
#     for Calendar
#   features: [BigInt, Symbol, Temporal]
module Temporal::PlainDate::Calendar
  class InvalidIsoString < Minitest::Test
    {
      boolean: true,
      number: 1,
      bigint: (1 << 64) + 1,
      negative_number: -19_761_118,
      large_positive_number: 19_761_118,
      large_integer: 1_234_567_890,
      array: [],
      object: self,
      duration_instance: Temporal::Duration.new,
    }.each do |name, value|
      define_method("test_calendar_id_with_#{name}") do
        assert_raises(RangeError) { Temporal::PlainDate.new(2020, 1, 1, calendar_id: value) }
      end
    end
  end
end
