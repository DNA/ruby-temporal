# frozen_string_literal: true

require_relative "plain_date_helper"

# PlainDate constructor with invalid iso dates
#
# @note test262 info
#   esid: sec-temporal.plaindate
#   description: PlainDate constructor with invalid iso dates
#   features: [Temporal]
module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    {
      month_overflow: [2020, 13, 24],
      month_zero: [2020, 0, 24],
      month_negative: [2020, -3, 24],
      day_overflow: [2020, 12, 32],
      leap_february_overflow: [2020, 2, 30],
      february_overflow: [2019, 2, 29],
      day_zero: [2019, 2, 0],
      day_negative: [2019, 2, -20],
    }.each do |name, data|
      define_method("test_#{name}") do
        year, month, day = data

        assert_raises(RangeError) { Temporal::PlainDate.new(year, month, day) }
      end
    end
  end
end
