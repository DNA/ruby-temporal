# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: >
#   Throws RangeError when any duration component is a too large finite number.
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

JS_MAX_VALUE = (2**1024) - (2**971)

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
      define_method "test_large_#{name}" do
        assert_raises(RangeError) { Temporal::Duration.new(*Array.new(i, 0), JS_MAX_VALUE) }
      end
    end
  end
end
