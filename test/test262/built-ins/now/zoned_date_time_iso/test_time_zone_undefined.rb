# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Functions when time zone argument is omitted
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::ZonedDateTimeISO
  class Timezone < Minitest::Test
    def test_undefined_timezone
      time_zone = Temporal::Now.time_zone_id
      subject = Temporal::Now.zoned_date_time_iso

      assert_equal(subject.time_zone_id, time_zone, "time zone string should be the system time zone")
    end
  end
end
