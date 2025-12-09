# frozen_string_literal: true

require_relative "plain_date_helper"

# Basic tests for the PlainDate constructor
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/constructor.js
#   esid: sec-temporal.plaindate
#   description: Temporal.PlainDate constructor cannot be called as a function
#   info: |
#       1. If NewTarget is undefined, throw a TypeError exception.
#   features: [Temporal]
class Temporal::PlainDate::Constructor < Minitest::Test
  def test_raise_on_direct_call
    assert_raises(NoMethodError) { Temporal::PlainDate(2021, 12, 22, :iso8601) }
  end
end
