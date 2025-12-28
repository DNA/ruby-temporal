# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth
# description: referenceISODay argument defaults to 1 if not given
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Calendar < Minitest::Test
    def test_show_explicit_year
      subject = Temporal::PlainYearMonth.new(2000, 5, day: nil)
      day = subject.to_s(calendar_name: :always).split("-")[2][..1]

      assert_equal("01", day, "default referenceISODay is 1")
    end

    def test_show_implicit_year
      subject = Temporal::PlainYearMonth.new(2000, 5)
      day = subject.to_s(calendar_name: :always).split("-")[2][..1]

      assert_equal("1", day, "default referenceISODay is 1")
    end
  end
end
