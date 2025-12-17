# frozen_string_literal: true

require_relative "../../plain_date_helper"

# Any missing argument on PlainDate#add is equal to zero
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/prototype/add/argument-mixed-sign.js
#   esid: sec-temporal.plaindate.prototype.add
#   description: Positive and negative values in the temporalDurationLike argument are not acceptable
#   features: [Temporal]
module Temporal::TestPlainDate
  class Add < Minitest::Test
    def test_raise_with_mixed_signals_and_constrain
      assert_raises(RangeError) do
        subject.add({ hours: 1, minutes: -30 }, overflow: :constrain)
      end

      assert_raises(RangeError) do
        subject.add(hours: 1, minutes: -30, overflow: :constrain)
      end
    end

    def test_raise_with_mixed_signals_and_reject
      assert_raises(RangeError) do
        subject.add({ hours: 1, minutes: -30 }, overflow: :reject)
      end

      assert_raises(RangeError) do
        subject.add(hours: 1, minutes: -30, overflow: :reject)
      end
    end
  end
end
