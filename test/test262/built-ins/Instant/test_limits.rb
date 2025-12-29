# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.instant
# description: Min/max range.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestInstant
  class Constructor < Minitest::Test
    def limit
      8_640_000_000_000_000_000_000
    end

    def test_limit_overflow
      assert_raises(RangeError) { Temporal::Instant.new(limit + 1) }
    end

    def test_limit_underflow
      assert_raises(RangeError) { Temporal::Instant.new(-limit - 1) }
    end

    def test_positive_limit
      skip "Check test after implementing Instant#from"

      assert_instants_equal(
        Temporal::Instant.new(-limit),
        Temporal::Instant.from("-271821-04-20T00:00:00Z")
      )
    end

    def test_negative_limit
      skip "Check test after implementing Instant#from"

      assert_instants_equal(
        Temporal::Instant.new(limit),
        Temporal::Instant.from("+275760-09-13T00:00:00Z")
      )
    end
  end
end
