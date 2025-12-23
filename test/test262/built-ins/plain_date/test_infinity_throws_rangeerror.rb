# frozen_string_literal: true

# Original comment:
#
# /*---
# description: Temporal.PlainDate throws a RangeError if any value is Infinity
# esid: sec-temporal.plaindate
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    [
      ["infinite_year",  Float::INFINITY, 1, 1],
      ["infinite_month", 1970, Float::INFINITY, 1],
      ["infinite_day",   1970, 1, Float::INFINITY],
    ].each do |name, year, month, day|
      define_method "test_#{name}" do
        assert_raises(RangeError) { Temporal::PlainDate.new(year, month, day) }
      end
    end
  end
end
