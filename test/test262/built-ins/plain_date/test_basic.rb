# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: Basic tests for the PlainDate constructor.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_basic
      plain_date = Temporal::PlainDate.new(2020, 12, 24, calendar_id: "iso8601")

      assert_plain_date(plain_date, 2020, 12, :M12, 24, "with string")
      assert_equal(:iso8601, plain_date.calendar_id, "calendar string is iso8601")
    end
  end
end
