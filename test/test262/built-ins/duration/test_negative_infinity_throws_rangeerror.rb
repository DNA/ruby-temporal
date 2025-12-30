# frozen_string_literal: true

# Original comment
#
# /*---
# description: Temporal.Duration throws a RangeError if any value is -Infinity
# esid: sec-temporal.duration
# includes: [compareArray.js, temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    %i[
      years
      months
      weeks
      days
      hours
      minutes
      seconds
      milliseconds
      microseconds
      nanoseconds
    ].each_with_index do |name, i|
      define_method "test_negative_infinity_#{name}" do
        assert_raises(RangeError) { Temporal::Duration.new(*Array.new(i, 0), -Float::INFINITY) }
      end
    end
  end
end
