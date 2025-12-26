# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday
# description: referenceISOYear argument, if given, can cause RangeError
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Constructor < Minitest::Test
    def test_after_maximum_iso_data
      skip "Check values after PlainMonthYear is done"

      assert_equal(
        RangeError,
        Temporal::PlainMonthDay.new(9, 14, year: 275_760),
        "after the maximum ISO date"
      )
    end

    def test_before_maximum_iso_data
      skip "Check values after PlainMonthYear is done"

      assert_equal(
        RangeError,
        Temporal::PlainMonthDay.new(4, 18, year: -271_821),
        "before the minimum ISO date"
      )
    end
  end
end
