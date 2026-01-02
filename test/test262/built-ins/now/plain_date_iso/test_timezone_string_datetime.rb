# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindateiso
# description: Conversion of ISO date-time strings to time zone IDs
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainDateISO
  class Timezone < Minitest::Test
    def test_bare_iso_string
      assert_raises(RangeError, "bare date-time string is not a time zone") do
        Temporal::Now.plain_date_iso("2021-08-19T17:30")
      end
    end

    def test_timezone_and_subseconds
      [
        "2021-08-19T17:30-07:00:01",
        "2021-08-19T17:30-07:00:00",
        "2021-08-19T17:30-07:00:00.1",
        "2021-08-19T17:30-07:00:00.0",
        "2021-08-19T17:30-07:00:00.01",
        "2021-08-19T17:30-07:00:00.00",
        "2021-08-19T17:30-07:00:00.001",
        "2021-08-19T17:30-07:00:00.000",
        "2021-08-19T17:30-07:00:00.0001",
        "2021-08-19T17:30-07:00:00.0000",
        "2021-08-19T17:30-07:00:00.00001",
        "2021-08-19T17:30-07:00:00.00000",
        "2021-08-19T17:30-07:00:00.000001",
        "2021-08-19T17:30-07:00:00.000000",
        "2021-08-19T17:30-07:00:00.0000001",
        "2021-08-19T17:30-07:00:00.0000000",
        "2021-08-19T17:30-07:00:00.00000001",
        "2021-08-19T17:30-07:00:00.00000000",
        "2021-08-19T17:30-07:00:00.000000001",
        "2021-08-19T17:30-07:00:00.000000000",
      ].each do |tz|
        assert_raises(RangeError,
                      "ISO string #{tz} with a sub-minute offset is not a valid time zone") do
          Temporal::Now.plain_date_iso(tz)
        end
      end
    end

    def test_correct_timezones
      [
        "2021-08-19T17:30Z",
        "2021-08-19T1730Z",
        "2021-08-19T17:30-07:00",
        "2021-08-19T1730-07:00",
        "2021-08-19T17:30-0700",
        "2021-08-19T1730-0700",
        "2021-08-19T17:30[UTC]",
        "2021-08-19T1730[UTC]",
        "2021-08-19T17:30Z[UTC]",
        "2021-08-19T1730Z[UTC]",
        "2021-08-19T17:30-07:00[UTC]",
        "2021-08-19T1730-07:00[UTC]",
        "2021-08-19T17:30-0700[UTC]",
        "2021-08-19T1730-0700[UTC]",
      ].each do |tz|
        assert(Temporal::Now.plain_date_iso(tz))
      end
    end
  end
end
