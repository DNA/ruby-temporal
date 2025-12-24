# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: Hour argument defaults to 0 if not given
# features: [Temporal]
# includes: [temporalHelpers.js]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    def test_explicit_nil_hour
      subject = Temporal::PlainDateTime.new(2000, 5, 2)

      assert_plain_date_time(subject, 2000, 5, :M05, 2, 0, 0, 0, 0, 0, 0, "explicit")
    end

    def test_implicit_nil_hour
      subject = Temporal::PlainDateTime.new(2000, 5, 2)

      assert_plain_date_time(subject, 2000, 5, :M05, 2, 0, 0, 0, 0, 0, 0, "implicit")
    end
  end
end
