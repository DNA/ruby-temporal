# frozen_string_literal: true

require "temporal/plain_date"

require "test_helper"

# PlainDate throws a RangeError if any value is Infinity
#
# @note test262 info
#   original:
#     - test/test262/built-in/PlainDate/infinity-throws-rangeerror.js
#     - test/test262/built-in/PlainDate/negative-infinity-throws-rangeerror.js
#   description: Temporal.PlainDate throws a RangeError if any value is Infinity
#   esid: sec-temporal.plaindate
#   includes: [compareArray.js, temporalHelpers.js]
#   features: [Temporal]
class Temporal::PlainDate::Infinity < Minitest::Test
  {
    positive_infinity_on_year: [Float::INFINITY, 1, 1],
    positive_infinity_on_month: [1970, Float::INFINITY, 1],
    positive_infinity_on_day: [1970, 1, Float::INFINITY],
    negative_infinity_on_year: [-Float::INFINITY, 1, 1],
    negative_infinity_on_month: [1970, -Float::INFINITY, 1],
    negative_infinity_on_day: [1970, 1, -Float::INFINITY],
  }.each do |name, data|
    define_method("test_raise_on_#{name}") do
      year, month, day = data

      assert_raises(RangeError) { Temporal::PlainDate.new(year, month, day) }
    end
  end
end
