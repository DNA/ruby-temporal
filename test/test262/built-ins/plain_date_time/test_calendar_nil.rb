# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Calendar argument defaults to the built-in ISO 8601 calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Calendar < Minitest::Test
    def test_explicit_nil
      datetime = Temporal::PlainDateTime.new(2020, 12, 24, 12, 34, 56, 123, 456, 789,
                                             calendar_id: nil)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end

    def test_implicit_nil
      datetime = Temporal::PlainDateTime.new(2020, 12, 24, 12, 34, 56, 123, 456, 789)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end
  end
end
