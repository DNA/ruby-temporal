# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaintime
# description: Second argument defaults to 0 if not given
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainTime
  class Constructor < Minitest::Test
    def test_explicit_nil_second
      plain_time = Temporal::PlainTime.new(12, 34)

      assert_plain_time(plain_time, 12, 34, 0, 0, 0, 0, "explicit")
    end

    def test_implicit_nil_second
      plain_time = Temporal::PlainTime.new(12, 34)

      assert_plain_time(plain_time, 12, 34, 0, 0, 0, 0, "implicit")
    end
  end
end
