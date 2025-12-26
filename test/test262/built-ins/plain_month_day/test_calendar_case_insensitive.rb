# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday
# description: Calendar names are case-insensitive
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Calendar < Minitest::Test
    def test_uppercase
      date = Temporal::PlainMonthDay.new(12, 15, calendar_id: "ISO8601")

      assert_equal(:iso8601, date.calendar_id)
    end

    def test_mixedcase
      date = Temporal::PlainMonthDay.new(12, 15, calendar_id: "iSo8601")

      assert_equal(:iso8601, date.calendar_id)
    end

    def test_non_ascii_case
      assert_raises(RangeError) do
        Temporal::PlainMonthDay.new(12, 15, calendar_id: "\u0130SO8601")
      end
    end
  end
end
