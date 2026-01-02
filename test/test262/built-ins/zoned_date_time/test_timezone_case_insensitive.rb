# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime.prototype.constructor
# description: Time zone names are case insensitive
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Timezone < Minitest::Test
    def test_case_insensitive
      date = Temporal::ZonedDateTime.new(0, tz: "uTc")

      assert_equal("UTC", date.time_zone_id)
    end
  end
end
