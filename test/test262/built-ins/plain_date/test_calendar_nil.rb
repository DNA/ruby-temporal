# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: Calendar argument defaults to the built-in ISO 8601 calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Calendar < Minitest::Test
    def test_explicit_nil
      date = Temporal::PlainDate.new(2020, 12, 24, calendar_id: nil)

      assert_equal(:iso8601, date.calendar_id, "calendar ID is iso8601")
    end

    def test_implicit_nil
      date = Temporal::PlainDate.new(2020, 12, 24, calendar_id: nil)

      assert_equal(:iso8601, date.calendar_id, "calendar ID is iso8601")
    end
  end
end
