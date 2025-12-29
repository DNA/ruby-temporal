# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: >
#   RangeError thrown when epoch nanoseconds not valid.
# info: |
#   Temporal.ZonedDateTime ( epochNanoseconds, timeZone [ , calendar ] )
#
#   2. Set epochNanoseconds to ? ToBigInt(epochNanoseconds).
#   3. If IsValidEpochNanoseconds(epochNanoseconds) is false, throw a RangeError exception.
#   ...
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Constructor < Minitest::Test
    def test_limits
      ns_max_instant = 864 * (10**19)
      ns_min_instant = -ns_max_instant

      invalid_epoch_nanoseconds = [
        ns_max_instant + 1,
        ns_min_instant - 1,
        2**128,
        -(2**128),
      ]

      time_zones = [
        "UTC",
        "+00",
        "+01",
        "-01",
      ]

      time_zones.each do |time_zone|
        invalid_epoch_nanoseconds.each do |epoch_ns|
          assert_raises(RangeError, "epochNs = #{epoch_ns}, timeZone = #{time_zone}") { Temporal::ZonedDateTime.new(epoch_ns, tz: time_zone) }
        end
      end
    end
  end
end
