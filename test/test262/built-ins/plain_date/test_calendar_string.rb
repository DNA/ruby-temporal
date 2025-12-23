# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate.constructor
# description: A calendar ID is valid input for Calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Calendar < Minitest::Test
    def test_string
      date = Temporal::PlainDate.new(2000, 5, 2, calendar_id: "iso8601")

      assert_equal(:iso8601, date.calendar_id)
    end
  end
end
