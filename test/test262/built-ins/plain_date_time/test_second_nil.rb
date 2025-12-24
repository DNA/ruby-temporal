# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Second argument defaults to 0 if not given
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    def test_explicit_nil_second
      subject = Temporal::PlainDateTime.new(2000, 5, 2, 12, 34)

      assert_plain_date_time(subject, 2000, 5, :M05, 2, 12, 34, 0, 0, 0, 0, "explicit")
    end

    def test_implicit_nil_second
      subject = Temporal::PlainDateTime.new(2000, 5, 2, 12, 34)

      assert_plain_date_time(subject, 2000, 5, :M05, 2, 12, 34, 0, 0, 0, 0, "implicit")
    end
  end
end
