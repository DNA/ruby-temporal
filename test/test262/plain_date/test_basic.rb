# frozen_string_literal: true

require_relative "plain_date_helper"

# Basic tests for the PlainDate constructor
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/basic.js
#   esid: sec-temporal.plaindate
#   description: Basic tests for the PlainDate constructor.
#   includes: [temporalHelpers.js]
#   features: [Temporal]
module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_basic_assert_with_calendar
      assert_valid_plain_date(2021, 12, 22, calendar_id: :iso8601)
    end

    def test_basic_assert_without_calendar
      assert_valid_plain_date(2021, 12, 22)
    end
  end
end
