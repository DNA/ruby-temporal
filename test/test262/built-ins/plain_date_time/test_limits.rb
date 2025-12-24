# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Checking limits of representable PlainDateTime
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    def test_raise_after_max_negative_date
      skip "Check values after PlainDateTime is done"

      assert_raises(RangeError) { Temporal::PlainDateTime.new(-271_821, 4, 18, 0, 0, 0, 0, 0, 0) }
    end

    def test_passes_on_max_negative_date
      skip "Check values after PlainDateTime is done"

      assert_valid_plain_date(-271_821, 4, 19, 0, 0, 0, 0, 0, 0)
    end

    def test_raise_after_max_positive_date
      skip "Check values after PlainDateTime is done"

      assert_raises(RangeError) { Temporal::PlainDateTime.new(275_760, 9, 14, 0, 0, 0, 0, 0, 0) }
    end

    def test_passes_on_max_positive_date
      skip "Check values after PlainDateTime is done"

      assert_valid_plain_date(275_760, 9, 13, 0, 0, 0, 0, 0, 0)
    end
  end
end
