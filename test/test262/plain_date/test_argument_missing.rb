# frozen_string_literal: true

require_relative "plain_date_helper"

# Raises RangeError thrown when called with no argument
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/missing-arguments.js
#   esid: sec-temporal.plaindate
#   description: RangeError thrown when constructor invoked with no argument
#   includes: [compareArray.js]
#   features: [Temporal]
module Temporal::TestPlainDate
  class Constructor < Minitest::Test
    def test_raise_on_missing_params
      assert_raises(ArgumentError) { Temporal::PlainDate.new }
    end
  end
end
