# frozen_string_literal: true

# Original comment
#
# /*---
# description: Temporal.Duration throws a RangeError if any value is fractional
# esid: sec-temporal.duration
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
      define_method "test_fractional_#{name}" do
        assert_raises(RangeError) { Temporal::Duration.new(*Array.new(i, 0), 1.1) }
      end
    end
  end
end
