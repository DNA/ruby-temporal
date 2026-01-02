# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Time zone names are case insensitive
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::ZonedDateTimeISO
  class Timezone < Minitest::Test
    def test_case_insensitive
      time_zone = "UtC"
      subject = Temporal::Now.zoned_date_time_iso(time_zone)

      assert_equal("UTC", subject.time_zone_id)
    end
  end
end
