# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plainyearmonth
# description: Limits for the PlainYearMonth constructor.
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainYearMonth
  class Constructor < Minitest::Test
    def test_over_max_date
      skip "Check values after PlainYearMonth is done"

      assert_raises(RangeError) { Temporal::PlainYearMonth.new(275_760, 10) }
    end

    def test_below_min_date
      skip "Check values after PlainYearMonth is done"

      assert_raises(RangeError) { Temporal::PlainYearMonth.new(-271_821, 3) }
    end

    def test_on_max_date
      subject = Temporal::PlainYearMonth.new(275_760, 9)

      assert_plain_year_month(subject, 275_760, 9, :M09)
    end

    def test_on_min_date
      subject = Temporal::PlainYearMonth.new(-271_821, 4)

      assert_plain_year_month(subject, -271_821, 4, :M04)
    end

    def test_on_min_date_with_ref_day
      subject = Temporal::PlainYearMonth.new(-271_821, 4, day: 18)

      assert_plain_year_month(subject, -271_821, 4, :M04,
                              "min with referenceISODay",
                              nil, # era
                              nil, # eraYear
                              18)  # referenceISODay
    end

    def test_on_max_date_with_ref_day
      subject = Temporal::PlainYearMonth.new(275_760, 9, day: 14)

      assert_plain_year_month(subject, 275_760, 9, :M09,
                              "max with referenceISODay",
                              nil, # era
                              nil, # eraYear
                              14)  # referenceISODay
    end
  end
end
