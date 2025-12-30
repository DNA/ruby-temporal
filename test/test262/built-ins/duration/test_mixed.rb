# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: Constructor with mixed signs.
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    {
      years:        [-1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      months:       [1, -1, 1, 1, 1, 1, 1, 1, 1, 1],
      weeks:        [1, 1, -1, 1, 1, 1, 1, 1, 1, 1],
      days:         [1, 1, 1, -1, 1, 1, 1, 1, 1, 1],
      hours:        [1, 1, 1, 1, -1, 1, 1, 1, 1, 1],
      minutes:      [1, 1, 1, 1, 1, -1, 1, 1, 1, 1],
      seconds:      [1, 1, 1, 1, 1, 1, -1, 1, 1, 1],
      milliseconds: [1, 1, 1, 1, 1, 1, 1, -1, 1, 1],
      microseconds: [1, 1, 1, 1, 1, 1, 1, 1, -1, 1],
      nanoseconds:  [1, 1, 1, 1, 1, 1, 1, 1, 1, -1],
    }.each do |name, args|
      define_method "test_mixed_#{name}" do
        assert_raises(RangeError) { Temporal::Duration.new(*args) }
      end
    end
  end
end
