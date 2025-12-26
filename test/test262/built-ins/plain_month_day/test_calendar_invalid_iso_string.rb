# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday.constructor
# description: Various invalid ISO string values for calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Calendar < Minitest::Test
    def test_raises_on_empty_string
      assert_raises(RangeError) { Temporal::PlainMonthDay.new(12, 15, calendar_id: "") }
    end

    def test_raises_on_iso_string
      assert_raises(RangeError) do
        Temporal::PlainMonthDay.new(12, 15, calendar_id: "1997-12-04[u-ca=iso8601]")
      end
    end
  end
end
