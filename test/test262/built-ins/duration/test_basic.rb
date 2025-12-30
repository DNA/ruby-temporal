# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: Basic constructor tests.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    def test_positive
      assert_duration(
        Temporal::Duration.new(5, 5, 5, 5, 5, 5, 5, 5, 5, 0),
        5, 5, 5, 5, 5, 5, 5, 5, 5, 0
      )
    end

    def test_negative
      assert_duration(
        Temporal::Duration.new(-5, -5, -5, -5, -5, -5, -5, -5, -5, 0),
        -5, -5, -5, -5, -5, -5, -5, -5, -5, 0
      )
    end

    def test_negative_zero
      assert_duration(
        Temporal::Duration.new(-0, -0, -0, -0, -0, -0, -0, -0, -0, -0),
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      )
    end
  end
end
