# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.instant
# description: >
#   Temporal.Now.instant returns an Instant describing the current moment in time
#   (as corroborated by `Date.now`)
# features: [BigInt, Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestInstant
  class Constructor < Minitest::Test
    def test_return_value
      now_before = Time.now.to_f
      seconds    = Temporal::Now.instant.epoch_nanoseconds
      now_after  = Time.now.to_f

      assert_operator(seconds, :>=, now_before, "(seconds >= now_before) is expected to be true")
      assert_operator(seconds, :<=, now_after, "(seconds <= now_after) is expected to be true")
    end
  end
end
