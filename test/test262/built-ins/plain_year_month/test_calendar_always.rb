# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth
# description: If calendar name is to be emitted, include additional reference info
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Calendar < Minitest::Test
    def test_show_explicit_year_when_calendar_name_is_always
      subject = Temporal::PlainYearMonth.new(2019, 10, day: 31)

      assert_equal(
        "2019-10-31[u-ca=iso8601]",
        subject.to_s(calendar_name: :always),
        "emit year-month-day if calendar_name = 'always' (four-argument constructor)"
      )
    end

    def test_show_implicit_year_when_calendar_name_is_always
      subject = Temporal::PlainYearMonth.new(2019, 10)

      assert_equal(
        "2019-10-01[u-ca=iso8601]",
        subject.to_s(calendar_name: :always),
        "emit fallback day if calendar_name = 'always' (static from)"
      )
    end
  end
end
