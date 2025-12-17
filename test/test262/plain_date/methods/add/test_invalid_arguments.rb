# frozen_string_literal: true

require_relative "../../plain_date_helper"

# Passing argument other than hash or kwargs raises ArgumentError
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/prototype/add/argument-mixed-sign.js
#   esid: sec-temporal.plaindate.prototype.add
#   description: Passing a primitive other than string to add() throws
#   features: [Symbol, Temporal]
module Temporal::TestPlainDate
  class Add < Minitest::Test
    def test_nil
      assert_raises(ArgumentError) { subject.add(nil) }
    end

    def test_boolean
      assert_raises(ArgumentError) { subject.add(true) }
    end

    def test_empty_string
      assert_raises(ArgumentError) { subject.add("") }
    end

    def test_symbol
      assert_raises(ArgumentError) { subject.add(:foo) }
    end

    def test_number
      assert_raises(ArgumentError) { subject.add(7) }
    end

    def test_big_number
      assert_raises(ArgumentError) { subject.add(1 << 64) }
    end

    def test_empty_array
      assert_raises(ArgumentError) { subject.add([]) }
    end

    def test_lambda
      assert_raises(ArgumentError) { subject.add(->(f) { f }) }
    end
  end
end
