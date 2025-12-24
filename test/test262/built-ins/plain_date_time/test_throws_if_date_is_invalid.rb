# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: >
#   Throws if any date value is outside the valid bounds.
# info: |
#   Temporal.PlainDateTime ( isoYear, isoMonth, isoDay [ , hour [ , minute
#                            [ , second [ , millisecond [ , microsecond
#                            [ , nanosecond [ , calendar ] ] ] ] ] ] ] )
#
#   ...
#   16. If IsValidISODate(isoYear, isoMonth, isoDay) is false, throw a RangeError exception.
#   ...
#
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
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
        assert_raises(ArgumentError) { Temporal::PlainDateTime.new(*args) }
      end
    end
  end
end
