# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.timezoneid
# description: Temporal.Now.timeZoneId returns a string
# info: |
#   1. Return DefaultTimeZone().
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal
  class Now::TestMethod < Minitest::Test
    def test_return
      assert_instance_of(
        ::String, Temporal::Now.time_zone_id,
        "Temporal::Now.time_zone_id returns a string"
      )
    end
  end
end
