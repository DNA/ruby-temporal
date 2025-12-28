# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth
# description: PlainYearMonth constructor works
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Constructor < Minitest::Test
    def test_basic
      subject = Temporal::PlainYearMonth.new(1976, 11)

      assert_plain_year_month(subject, 1976, 11, :M11)
    end
  end
end
