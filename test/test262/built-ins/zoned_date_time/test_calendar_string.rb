# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime.constructor
# description: A calendar ID is valid input for Calendar
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Calendar < Minitest::Test
    def test_string
      date = Temporal::ZonedDateTime.new(0, calendar_id: "iso8601")

      assert_equal(:iso8601, date.calendar_id)
    end
  end
end
