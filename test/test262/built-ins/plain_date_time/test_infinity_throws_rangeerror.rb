# frozen_string_literal: true

# Original comment:
#
# /*---
# description: Temporal.PlainDateTime throws a RangeError if any value is Infinity
# esid: sec-temporal.plaindatetime
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    [
      ["year",        [Float::INFINITY, 1, 1]],
      ["month",       [1970, Float::INFINITY, 1]],
      ["day",         [1970, 1, Float::INFINITY]],
      ["hour",        [1970, 1, 1, Float::INFINITY]],
      ["minute",      [1970, 1, 1, 0, Float::INFINITY]],
      ["second",      [1970, 1, 1, 0, 0, Float::INFINITY]],
      ["millisecond", [1970, 1, 1, 0, 0, 0, Float::INFINITY]],
      ["microsecond", [1970, 1, 1, 0, 0, 0, 0, Float::INFINITY]],
      ["nanosecond",  [1970, 1, 1, 0, 0, 0, 0, 0, Float::INFINITY]],
    ].each do |name, args|
      define_method "test_infinite_#{name}" do
        assert_raises(RangeError) { Temporal::PlainDateTime.new(*args) }
      end
    end
  end
end
