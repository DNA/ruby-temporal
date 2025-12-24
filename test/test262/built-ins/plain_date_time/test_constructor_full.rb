# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Checking an explicitly constructed instance with all arguments
# features: [Temporal]
# includes: [temporalHelpers.js]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    def test_basic
      datetime = Temporal::PlainDateTime
                 .new(1976, 11, 18,
                      15, 23, 30,
                      123, 456, 789,
                      calendar_id: "iso8601")

      assert_plain_date_time(datetime,
                             1976, 11, :M11, 18,
                             15, 23, 30,
                             123, 456, 789,
                             "check instance (all arguments supplied)")

      assert_equal(:iso8601, datetime.calendar_id,
                   "calendar supplied in constructor can be extracted and is unchanged")
    end
  end
end
