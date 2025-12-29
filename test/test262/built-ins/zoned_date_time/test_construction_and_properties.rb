# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: Construction and properties.
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Constructor < Minitest::Test
    def test_basic # rubocop:disable Metrics/AbcSize
      epoch = Time.utc(1976, 11, 18, 15, 23, 30).to_i
      epoch_nanos = (epoch * 1_000_000_000) + 123_456_789

      # Temporal::ZonedDateTime for (1976, 11, 18, 15, 23, 30, 123, 456, 789)"
      zdt = Temporal::ZonedDateTime.new(epoch_nanos, tz: "UTC")

      assert_equal(1976, zdt.year)
      assert_equal(11, zdt.month)
      assert_equal(:M11, zdt.month_code)
      assert_equal(18, zdt.day)
      assert_equal(15, zdt.hour)
      assert_equal(23, zdt.minute)
      assert_equal(30, zdt.second)
      assert_equal(123, zdt.millisecond)
      assert_equal(456, zdt.microsecond)
      assert_equal(789, zdt.nanosecond)
      assert_equal(217_178_610_123, zdt.epoch_milliseconds)
      assert_equal(217_178_610_123_456_789, zdt.epoch_nanoseconds)
      assert_equal(4, zdt.day_of_week)
      assert_equal(323, zdt.day_of_year)
      assert_equal(47, zdt.week_of_year)
      assert_equal(7, zdt.days_in_week)
      assert_equal(30, zdt.days_in_month)
      assert_equal(366, zdt.days_in_year)
      assert_equal(12, zdt.months_in_year)
      assert_predicate(zdt, :leap_year?)
      assert_equal("+00:00", zdt.offset)
      assert_equal(0, zdt.offset_nanoseconds)
      assert_equal("1976-11-18T15:23:30.123456789+00:00[UTC]", zdt.to_s)
    end

    def test_instant_equality
      skip "Create this test after implementing Temporal::Instant#epoch_milliseconds"

      epoch_millis = Time.utc(1976, 10, 18, 15, 23, 30, 123).to_i
      epoch_nanos = (epoch_millis * 1_000_000) + 456_789
      zdt = Temporal::ZonedDateTime.new(epoch_nanos, "-08:00")

      assert_equal(zdt.to_instant.epoch_milliseconds, Time.utc(1976, 10, 18, 15, 23, 30, 123), "epoch_milliseconds")
    end
  end
end
