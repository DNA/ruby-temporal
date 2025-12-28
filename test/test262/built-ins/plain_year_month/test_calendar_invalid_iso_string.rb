# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth.constructor
# description: Various invalid ISO string values for calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Calendar < Minitest::Test
    def test_raises_on_empty_string
      assert_raises(RangeError) { Temporal::PlainYearMonth.new(12, 15, calendar_id: "") }
    end

    def test_raises_on_iso_string
      assert_raises(RangeError) do
        Temporal::PlainYearMonth.new(12, 15, calendar_id: "1997-12-04[u-ca=iso8601]")
      end
    end
  end
end
