# frozen_string_literal: true

require_relative "../plain_date_helper"

# PlainDate constructor with non-integer arguments
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/calendar-invalid-iso-string.js
#   esid: sec-temporal.plaindate.constructor
#   description: Various invalid ISO string values for calendar
#   features: [Temporal]
module Temporal::PlainDate::Calendar
  class InvalidIsoString < Minitest::Test
    {
      empty_string: "",
      iso_string_with_calendar: "1997-12-04[u-ca=iso8601]",
    }.each do |name, value|
      define_method("test_calendar_id_with_#{name}") do
        assert_raises(RangeError) { Temporal::PlainDate.new(2020, 1, 1, calendar_id: value) }
      end
    end
  end
end
