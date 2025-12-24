# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.plaindatetime
# description: >
#   Throws if any time value is outside the valid bounds.
# info: |
#   Temporal.PlainDateTime ( isoYear, isoMonth, isoDay [ , hour [ , minute
#                            [ , second [ , millisecond [ , microsecond
#                            [ , nanosecond [ , calendar ] ] ] ] ] ] ] )
#
#   ...
#   16. If IsValidTime(hour, minute, second, millisecond, microsecond, nanosecond)
#       is false, throw a RangeError exception.
#   ...
#
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestPlainDateTime
  class Constructor < Minitest::Test
    [
      ["negative_hour",        [-1]],
      ["over_hour",            [24]],
      ["negative_minute",      [0, -1]],
      ["over_minute",          [0, 60]],
      ["negative_second",      [0, 0, -1]],
      ["over_second",          [0, 0, 60]],
      ["negative_millisecond", [0, 0, 0, -1]],
      ["over_millisecond",     [0, 0, 0, 1000]],
      ["negative_microsecond", [0, 0, 0, 0, -1]],
      ["over_microsecond",     [0, 0, 0, 0, 1000]],
      ["negative_nanosecond",  [0, 0, 0, 0, 0, -1]],
      ["over_nanosecond",      [0, 0, 0, 0, 0, 1000]],
    ].each do |name, args|
      define_method("test_invalid_#{name}") do
        assert_raises(RangeError) { Temporal::PlainDateTime.new(1970, 1, 1, *args) }
      end
    end
  end
end
