# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaintime
# description: Negative zero arguments are treated as zero.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainTime
  class Constructor < Minitest::Test
    def test_basic
      plain_time = Temporal::PlainTime.new(-0, -0, -0, -0, -0, -0)

      assert_plain_time(plain_time, 0, 0, 0, 0, 0, 0)
    end
  end
end
