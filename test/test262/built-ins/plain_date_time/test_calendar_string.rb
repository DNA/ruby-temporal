# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime.constructor
# description: A calendar ID is valid input for Calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Calendar < Minitest::Test
    def test_string
      date = Temporal::PlainDateTime.new(2000, 5, 2, 15, 23, 30, 987, 654, 321,
                                         calendar_id: "iso8601")

      assert_equal(:iso8601, date.calendar_id)
    end
  end
end
