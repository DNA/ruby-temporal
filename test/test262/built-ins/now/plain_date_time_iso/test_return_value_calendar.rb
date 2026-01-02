# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindatetimeiso
# description: Temporal.Now.plainDateTimeISO is extensible.
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainDateTimeISO
  class Constructor < Minitest::Test
    def test_return
      subject = Temporal::Now.plain_date_time_iso

      assert_instance_of(Temporal::PlainDateTime, subject)

      assert_equal(:iso8601, subject.calendar_id, "calendar id should be iso8601")
    end
  end
end
