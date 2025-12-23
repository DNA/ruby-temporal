# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindate
# description: PlainDate constructor with invalid iso dates
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    [
      "zero_month",                [2020, 0,   24],
      "over_month",                [2020, 13,  24],
      "negative_month",            [2020, -3,  24],
      "over_day",                  [2020, 12,  32],
      "feb_over_day_leap_year",    [2020,  2,  30],
      "feb_over_day_non_leap_ear", [2019,  2,  29],
      "zero_day",                  [2019,  2,   0],
      "negative_day",              [2019,  2, -20],
    ].each do |name, args|
      define_method "test_#{name}" do
        assert_raises(ArgumentError) { Temporal::PlainDate.new(*args) }
      end
    end
  end
end
