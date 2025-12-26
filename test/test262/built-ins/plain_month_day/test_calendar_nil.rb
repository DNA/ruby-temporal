# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday
# description: Calendar argument defaults to the built-in ISO 8601 calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Calendar < Minitest::Test
    def test_explicit_nil
      datetime = Temporal::PlainMonthDay.new(12, 15, calendar_id: nil)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end

    def test_implicit_nil
      datetime = Temporal::PlainMonthDay.new(12, 15)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end
  end
end
