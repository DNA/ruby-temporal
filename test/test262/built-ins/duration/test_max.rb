# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.duration
# description: Maximum values of arguments to the Duration constructor
# includes: [temporalHelpers.js]
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestDuration
  class Constructor < Minitest::Test
    [
      # rubocop:disable Layout/ExtraSpacing
      ["min_days",    [0, 0, 0,  -104_249_991_374, -7, -36, -31, -999, -999, -999], -9_007_199_254_740_991.999999999],
      ["max_days",    [0, 0, 0,   104_249_991_374,  7,  36,  31,  999,  999,  999],  9_007_199_254_740_991.999999999],
      ["min_hours",   [0, 0, 0, 0, -2_501_999_792_983, -36, -31, -999, -999, -999], -9_007_199_254_740_991.999999999],
      ["max_hours",   [0, 0, 0, 0,  2_501_999_792_983,  36,  31,  999,  999,  999],  9_007_199_254_740_991.999999999],
      ["min_minutes", [0, 0, 0, 0, 0, -150_119_987_579_016, -31, -999, -999, -999], -9_007_199_254_740_991.999999999],
      ["max_minutes", [0, 0, 0, 0, 0,  150_119_987_579_016,  31,  999,  999,  999],  9_007_199_254_740_991.999999999],
      ["min_seconds", [0, 0, 0, 0, 0, 0, -9_007_199_254_740_991, -999, -999, -999], -9_007_199_254_740_991.999999999],
      ["max_seconds", [0, 0, 0, 0, 0, 0,  9_007_199_254_740_991,  999,  999,  999],  9_007_199_254_740_991.999999999],
      # rubocop:enable Layout/ExtraSpacing
    ].each do |name, args, expectation|
      define_method "test_#{name}" do
        subject = Temporal::Duration.new(*args)

        assert_equal(subject.total(:seconds), expectation)
      end
    end

    def test_max_duration
      # 2^32 - 1 = 4294967295
      subject = Temporal::Duration.new(
        4_294_967_295, 4_294_967_295, 4_294_967_295, 104_249_991_374,
        7, 36, 31, 999, 999, 999
      )

      assert_duration(
        subject,
        4_294_967_295, 4_294_967_295, 4_294_967_295, 104_249_991_374,
        7, 36, 31, 999, 999, 999
      )
    end

    def test_min_duration
      # 2^32 - 1 = 4294967295
      subject = Temporal::Duration.new(
        -4_294_967_295, -4_294_967_295, -4_294_967_295, -104_249_991_374,
        -7, -36, -31, -999, -999, -999
      )

      assert_duration(
        subject,
        -4_294_967_295, -4_294_967_295, -4_294_967_295, -104_249_991_374,
        -7, -36, -31, -999, -999, -999
      )
    end
  end
end
