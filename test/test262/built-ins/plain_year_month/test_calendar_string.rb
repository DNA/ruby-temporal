# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth.constructor
# description: A calendar ID is valid input for Calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Calendar < Minitest::Test
    def test_string
      datetime = Temporal::PlainYearMonth.new(2000, 5, calendar_id: "iso8601")

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end
  end
end
