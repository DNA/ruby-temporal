# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.zoneddatetimeiso
# description: Conversion of ISO date-time strings to time zone IDs
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestZonedDateTimeISO
  class Timezone < Minitest::Test
    def test_bare_iso_string
      assert_raises(RangeError, "bare date-time string is not a time zone") do
        Temporal::Now.plain_time_iso("2021-08-19T17:30")
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
          Temporal::Now.plain_time_iso(tz)
        end
      end
    end

    def test_only_z_is_utc
      subject = Temporal::Now.zoned_date_time_iso("2021-08-19T17:30Z")

      assert_equal("UTC", subject.time_zone_id,
                   "date-time + Z is UTC time zone")
    end

    def test_datetime_offset
      subject = Temporal::Now.zoned_date_time_iso("2021-08-19T17:30-07:00")

      assert_equal("-07:00", subject.time_zone_id,
                   "date-time + offset is the offset time zone")
    end

    def test_iana
      subject = Temporal::Now.zoned_date_time_iso("2021-08-19T17:30[UTC]")

      assert_equal("UTC", subject.time_zone_id,
                   "date-time + IANA annotation is the IANA time zone")
    end

    def test_z_iana
      subject = Temporal::Now.zoned_date_time_iso("2021-08-19T17:30Z[UTC]")

      assert_equal("UTC", subject.time_zone_id,
                   "date-time + Z + IANA annotation is the IANA time zone")
    end

    def test_offset_iana
      subject = Temporal::Now.zoned_date_time_iso("2021-08-19T17:30-07:00[UTC]")

      assert_equal("UTC", subject.time_zone_id,
                   "date-time + offset + IANA annotation is the IANA time zone")
    end
  end
end
