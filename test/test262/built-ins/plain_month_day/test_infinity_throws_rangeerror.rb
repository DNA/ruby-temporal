# frozen_string_literal: true

# Original comment
#
# /*---
# description: Temporal.PlainMonthDay throws a RangeError if any numerical value is Infinity
# esid: sec-temporal.plainmonthday
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Constructor < Minitest::Test
    [
      ["month", Float::INFINITY, 1, nil],
      ["day",   1, Float::INFINITY, nil],
      ["year",  1, 1, Float::INFINITY],
    ].each do |name, month, day, year|
      define_method "test_infinity_#{name}" do
        assert_raises(RangeError) { Temporal::PlainMonthDay.new(month, day, year: year) }
      end
    end
  end
end
