# frozen_string_literal: true

require_relative "../../plain_date_helper"

# Any missing argument on PlainDate#add is equal to zero
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/methods/add/test_optional_arguments.rb
#   esid: sec-temporal.plaindate.prototype.add
#   description: >
#     A property bag missing optional properties is equivalent to a property bag
#     with all the optional properties having their default values
#   features: [Temporal]
module Temporal::PlainDate::Add
  class OptionalArguments < Minitest::Test
    def subject
      Temporal::PlainDate.new(2000, 5, 2)
    end

    def test_optional_arguments
      result_single = subject.add(hours: 1)
      result_full = subject.add(
        years: 0,
        months: 0,
        weeks: 0,
        days: 0,
        hours: 1,
        minutes: 0,
        seconds: 0,
        milliseconds: 0,
        microseconds: 0,
        nanoseconds: 0
      )

      assert_equal(result_single, result_full)
    end
  end
end
