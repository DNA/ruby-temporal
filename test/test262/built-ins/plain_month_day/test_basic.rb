# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainmonthday
# description: Basic tests for the PlainMonthDay constructor.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainMonthDay
  class Constructor < Minitest::Test
    def test_supports_leap_days
      subject = Temporal::PlainMonthDay.new(2, 29)

      assert_plain_month_day(subject, :M02, 29, "leap day is supported")
      assert_equal(:iso8601, subject.calendar_id, "leap day calendar")
    end

    def test_ref_year_before_epoch
      subject = Temporal::PlainMonthDay.new(12, 2, year: 1920, calendar_id: :iso8601)

      assert_plain_month_day(subject, :M12, 2, "reference year before epoch", 1920)
      assert_equal(:iso8601, subject.calendar_id, "reference year before epoch calendar")
    end

    def test_ref_year_after_epoch
      subject = Temporal::PlainMonthDay.new(1, 7, year: 1980, calendar_id: :iso8601)

      assert_plain_month_day(subject, :M01, 7, "reference year after epoch", 1980)
      assert_equal(:iso8601, subject.calendar_id, "reference year after epoch calendar")
    end
  end
end
