# frozen_string_literal: true

# Original comment
#
# /*---
# description: Temporal.PlainDate throws a RangeError if any value is -Infinity
# esid: sec-temporal.plaintime
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainTime
  class Constructor < Minitest::Test
    [
      ["hour",        [-Float::INFINITY]],
      ["minute",      [0, -Float::INFINITY]],
      ["second",      [0, 0, -Float::INFINITY]],
      ["millisecond", [0, 0, 0, -Float::INFINITY]],
      ["microsecond", [0, 0, 0, 0, -Float::INFINITY]],
      ["nanosecond",  [0, 0, 0, 0, 0, -Float::INFINITY]],
    ].each do |name, args|
      define_method("test_negative_infinite_#{name}") do
        assert_raises(RangeError) { Temporal::PlainTime.new(*args) }
      end
    end
  end
end
