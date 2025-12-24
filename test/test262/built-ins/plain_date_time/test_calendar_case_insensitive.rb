# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Calendar names are case-insensitive
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Calendar < Minitest::Test
    def test_uppercase
      date = Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321, calendar_id: "ISO8601")

      assert_equal(:iso8601, date.calendar_id)
    end

    def test_mixedcase
      date = Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321, calendar_id: "iSo8601")

      assert_equal(:iso8601, date.calendar_id)
    end

    def test_non_ascii_case
      assert_raises(RangeError) do
        Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321, calendar_id: "\u0130SO8601")
      end
    end
  end
end
