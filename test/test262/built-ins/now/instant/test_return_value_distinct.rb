# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.instant
# description: Each invocation of the function produces a distinct object value
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestInstant
  class Constructor < Minitest::Test
    def test_return_value_distinct
      instant1 = Temporal::Now.instant
      instant2 = Temporal::Now.instant

      refute_equal(
        instant1, instant2,
        "The value of instant1 is expected to not equal the value of `instant2`"
      )
    end
  end
end
