# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday.constructor
# description: A calendar ID is valid input for Calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Calendar < Minitest::Test
    def test_string
      datetime = Temporal::PlainMonthDay.new(12, 15, calendar_id: "iso8601")

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end
  end
end
