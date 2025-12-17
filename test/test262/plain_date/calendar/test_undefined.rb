# frozen_string_literal: true

require_relative "../plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/calendar-undefined.js
#   esid: sec-temporal.plaindate
#   description: Calendar argument defaults to the built-in ISO 8601 calendar
#   features: [Temporal]
module Temporal::TestPlainDate
  class Calendar < Minitest::Test
    def test_calendar_without_explicit_value
      assert_valid_plain_date(2020, 1, 1, expected_calendar_id: :iso8601)
    end

    def test_calendar_with_nil
      assert_valid_plain_date(2020, 1, 1, calendar_id: nil, expected_calendar_id: :iso8601)
    end
  end
end
