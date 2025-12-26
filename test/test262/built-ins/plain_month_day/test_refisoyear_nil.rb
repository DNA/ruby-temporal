# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday
# description: referenceISOYear argument defaults to 1972 if not given
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Calendar < Minitest::Test
    def test_show_explicit_year
      subject = Temporal::PlainMonthDay.new(5, 2, year: nil)
      year = subject.to_s(calendar_name: :always).split("-").first

      assert_equal("1972", year, "default referenceISOYear is 1972")
    end

    def test_show_implicit_year
      subject = Temporal::PlainMonthDay.new(5, 2)
      year = subject.to_s(calendar_name: :always).split("-").first

      assert_equal("1972", year, "default referenceISOYear is 1972")
    end
  end
end
