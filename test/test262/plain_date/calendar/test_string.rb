# frozen_string_literal: true

require_relative "../plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/calendar-string.js
#   esid: sec-temporal.plaindate.constructor
#   description: A calendar ID is valid input for Calendar
#   features: [Temporal]
module Temporal::PlainDate::Calendar
  class String < Minitest::Test
    def test_calendar_with_string_argument
      assert_valid_plain_date(2020, 1, 1, calendar_id: "iso8601", expected_calendar_id: :iso8601)
    end
  end
end
