# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime.constructor
# description: Various invalid ISO string values for calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Calendar < Minitest::Test
    def test_empty_string
      assert_raises(RangeError) do
        Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321, calendar_id: "")
      end
    end

    def test_iso_string_with_calendar_notation
      assert_raises(RangeError) do
        Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321,
                                    calendar_id: "1997-12-04[u-ca=iso8601]")
      end
    end
  end
end
