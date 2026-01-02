# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindatetimeiso
# description: Functions when time zone argument is omitted
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestDateTimeISO
  class Timezone < Minitest::Test
    def test_undefined_timezone
      subject = Temporal::Now.plain_date_time_iso

      assert_instance_of(Temporal::PlainDateTime, subject)
    end
  end
end
