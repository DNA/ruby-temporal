# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: Calendar argument defaults to the built-in ISO 8601 calendar
# features: [BigInt, Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Calendar < Minitest::Test
    def test_explicit_nil
      datetime = Temporal::ZonedDateTime.new(957_270_896_987_654_321, calendar_id: nil)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end

    def test_implicit_nil
      datetime = Temporal::ZonedDateTime.new(957_270_896_987_654_321)

      assert_equal(:iso8601, datetime.calendar_id, "calendar ID is iso8601")
    end
  end
end
