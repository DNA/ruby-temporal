# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Functions when time zone argument is omitted
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestZonedDateTimeISO
  class Constructor < Minitest::Test
    def test_return
      subject = Temporal::Now.zoned_date_time_iso

      assert_instance_of(Temporal::ZonedDateTime, subject)

      assert_equal(:iso8601, subject.calendar_id, "calendar id should be iso8601")
    end
  end
end
