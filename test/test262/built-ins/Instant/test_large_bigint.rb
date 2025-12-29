# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.instant
# description: >
#   Throws a RangeError if the input is far away from the epoch nanoseconds limits.
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestInstant
  class Constructor < Minitest::Test
    def test_positive_bigint
      assert_raises(RangeError) { Temporal::Instant.new(2**128) }
    end

    def test_negative_bigint
      assert_raises(RangeError) { Temporal::Instant.new(-(2**128)) }
    end
  end
end
