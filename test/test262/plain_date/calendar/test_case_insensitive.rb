# frozen_string_literal: true

require_relative "../plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/calendar-case-insensitive.js
#   esid: sec-temporal.plaindate
#   description: Calendar names are case-insensitive
#   features: [Temporal]
module Temporal::PlainDate::Calendar
  class CaseInsensitive < Minitest::Test
    def test_calendar_uppercase
      assert_valid_plain_date(2020, 1, 1, calendar_id: "ISO8601", expected_calendar_id: :iso8601)
    end

    def test_calendar_lowercase
      assert_valid_plain_date(2020, 1, 1, calendar_id: "iso8601", expected_calendar_id: :iso8601)
    end

    def test_calendar_mixedcase
      assert_valid_plain_date(2020, 1, 1, calendar_id: "iSo8601", expected_calendar_id: :iso8601)
    end

    def test_calendar_non_ascii_case
      assert_raises(RangeError) { Temporal::PlainDate.new(2020, 1, 1, calendar_id: "\u0130SO8601") }
    end
  end
end
