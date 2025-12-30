# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: Various arguments to the Duration constructor that are out of range
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    def test_year_month_week_limit
      # 2^32 = 4294967296
      limit = 4_294_967_296
      assert_raises(RangeError, "years > max")  { Temporal::Duration.new(limit) }
      assert_raises(RangeError, "years < min")  { Temporal::Duration.new(-limit) }
      assert_raises(RangeError, "months > max") { Temporal::Duration.new(0, limit) }
      assert_raises(RangeError, "months < min") { Temporal::Duration.new(0, -limit) }
      assert_raises(RangeError, "weeks > max")  { Temporal::Duration.new(0, 0, limit) }
      assert_raises(RangeError, "weeks < min")  { Temporal::Duration.new(0, 0, -limit) }
    end

    def test_days_limit
      # ceil(max safe integer / 86400) = 104249991375
      limit = 104_249_991_375

      assert_raises(RangeError, "days > max") { Temporal::Duration.new(0, 0, 0, limit) }
      assert_raises(RangeError, "days < min") { Temporal::Duration.new(0, 0, 0, -limit) }

      # one less day
      limit = 104_249_991_374

      assert_raises(RangeError, "hours balance into days > max") do
        Temporal::Duration.new(0, 0, 0, limit, 24)
      end
      assert_raises(RangeError, "hours balance into days < min") do
        Temporal::Duration.new(0, 0, 0, -limit, -24)
      end
    end

    def test_hours_limit
      # ceil(max safe integer / 3600) = 2501999792984
      limit = 2_501_999_792_984

      assert_raises(RangeError, "hours > max") { Temporal::Duration.new(0, 0, 0, 0, limit) }
      assert_raises(RangeError, "hours < min") { Temporal::Duration.new(0, 0, 0, 0, -limit) }

      # one less hour
      limit = 2_501_999_792_983

      assert_raises(RangeError, "minutes balance into hours > max") do
        Temporal::Duration.new(0, 0, 0, 0, limit, 60)
      end
      assert_raises(RangeError, "minutes balance into hours < min") do
        Temporal::Duration.new(0, 0, 0, 0, -limit, -60)
      end
    end

    def test_minutes_limit
      # ceil(max safe integer / 60) = 150119987579017
      # limit = 150_119_987_579_017

      # assert_raises(RangeError, "minutes > max") { Temporal::Duration.new(0, 0, 0, 0, 0, limit) }
      # assert_raises(RangeError, "minutes < min") { Temporal::Duration.new(0, 0, 0, 0, 0, -limit) }

      # one less minute
      limit = 150_119_987_579_016

      # assert_raises(RangeError, "seconds balance into minutes > max") do
      #   Temporal::Duration.new(0, 0, 0, 0, 0, limit, 60)
      # end
      assert_raises(RangeError, "seconds balance into minutes < min") do
        Temporal::Duration.new(0, 0, 0, 0, 0, -limit, -60)
      end
    end

    def test_seconds_limit
      # 2^53 = 9007199254740992
      limit = 9_007_199_254_740_992

      assert_raises(RangeError, "seconds > max") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, limit)
      end
      assert_raises(RangeError, "seconds < min") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, -limit)
      end
    end

    def test_subseconds_limit
      limit = 9_007_199_254_740_991

      assert_raises(RangeError, "ms balance into seconds > max") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, limit, 1000)
      end
      assert_raises(RangeError, "µs balance into seconds > max") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, limit, 999, 1000)
      end
      assert_raises(RangeError, "ns balance into seconds > max") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, limit, 999, 999, 1000)
      end

      assert_raises(RangeError, "ms balance into seconds < min") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, -limit, -1000)
      end
      assert_raises(RangeError, "µs balance into seconds < min") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, -limit, -999, -1000)
      end
      assert_raises(RangeError, "ns balance into seconds < min") do
        Temporal::Duration.new(0, 0, 0, 0, 0, 0, -limit, -999, -999, -1000)
      end
    end
  end
end
