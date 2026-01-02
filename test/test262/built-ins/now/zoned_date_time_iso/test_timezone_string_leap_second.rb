# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Leap second is a valid ISO string for TimeZone
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestZonedDateTimeISO
  class Timezone < Minitest::Test
    def test_date_with_leap_second
      # A string with a leap second is a valid ISO string,
      # so the following operation should not throw

      time_zone = "2016-12-31T23:59:60+00:00[UTC]"

      assert Temporal::Now.zoned_date_time_iso(time_zone)
    end

    def test_leap_second_on_offset
      time_zone = "2021-08-19T17:30:45.123456789+23:59[+23:59:60]"
      assert_raises(RangeError, "leap second in time zone name not valid") do
        Temporal::Now.zoned_date_time_iso(time_zone)
      end
    end
  end
end
