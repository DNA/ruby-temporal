# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: Time zone IDs are valid input for a time zone
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Timezone < Minitest::Test
    def test_tz_name
      date = Temporal::ZonedDateTime.new(0, tz: "utc")

      assert_equal("UTC", date.time_zone_id)
    end

    def test_tz_hour_minute
      date = Temporal::ZonedDateTime.new(0, tz: "+01:30")

      assert_equal("+01:30", date.time_zone_id)
    end
  end
end
