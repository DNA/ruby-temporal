# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindatetimeiso
# description: Time zone IDs are valid input for a time zone
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainDateTimeISO
  class Timezone < Minitest::Test
    def test_string
      ["UTC", "+01:00"].each do |timezone|
        assert Temporal::Now.plain_date_time_iso(timezone)
      end
    end
  end
end
