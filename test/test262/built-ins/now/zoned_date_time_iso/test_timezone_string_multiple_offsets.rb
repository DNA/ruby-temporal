# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Time zone parsing from ISO strings uses the bracketed offset, not the ISO string offset
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestZonedDateTimeISO
  class Timezone < Minitest::Test
    def test_use_bracked_over_offset
      time_zone = "2021-08-19T17:30:45.123456789-12:12[+01:46]"

      subject = Temporal::Now.zoned_date_time_iso(time_zone)

      assert_equal("+01:46", subject.time_zone_id, "Time zone string determined from bracket name")
    end
  end
end
