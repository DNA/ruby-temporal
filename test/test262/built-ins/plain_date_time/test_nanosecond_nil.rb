# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Nanosecond argument defaults to 0 if not given
# features: [Temporal]
# includes: [temporalHelpers.js]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainTime
  class Constructor < Minitest::Test
    def test_explicit_nil_nanosecond
      subject = Temporal::PlainDateTime.new(2000, 5, 2, 12, 34, 56, 123, 456)

      assert_plain_time(subject, 2000, 5, :M05, 2, 12, 34, 56, 123, 456, 0, "explicit")
    end

    def test_implicit_nil_nanosecond
      subject = Temporal::PlainDateTime.new(2000, 5, 2, 12, 34, 56, 123, 456)

      assert_plain_time(subject, 2000, 5, :M05, 2, 12, 34, 56, 123, 456, 0, "implicit")
    end
  end
end
