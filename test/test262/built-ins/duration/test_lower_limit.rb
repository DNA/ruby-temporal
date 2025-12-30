# frozen_string_literal: true

# Original comment
#
# /*---
# includes: [temporalHelpers.js]
# esid: sec-temporal.duration
# description: Minimum value is zero.
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    def test_zero
      assert_duration(
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      )
    end
  end
end
