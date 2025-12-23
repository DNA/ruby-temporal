# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: Limits for the PlainDate constructor.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_raise_after_max_negative_date
      skip "Check values after PlainDate is done"

      assert_raises(RangeError) { Temporal::PlainDate.new(-271_821, 4, 18) }
    end

    def test_passes_on_max_negative_date
      skip "Check values after PlainDate is done"

      assert_valid_plain_date(-271_821, 4, 19)
    end

    def test_raise_after_max_positive_date
      skip "Check values after PlainDate is done"

      assert_raises(RangeError) { Temporal::PlainDate.new(275_760, 9, 14) }
    end

    def test_passes_on_max_positive_date
      skip "Check values after PlainDate is done"

      assert_valid_plain_date(275_760, 9, 13)
    end
  end
end
