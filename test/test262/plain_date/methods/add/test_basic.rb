# frozen_string_literal: true

require_relative "../../plain_date_helper"

# Any missing argument on PlainDate#add is equal to zero
#
# @note test262 info
#   original: test/test262/built-in/PlainDate/prototype/add/basic.js
#   esid: sec-temporal.plaindate.prototype.add
#   description: Basic tests
#   includes: [temporalHelpers.js]
#   features: [Temporal]
module Temporal::TestPlainDate
  class Add < Minitest::Test
    {
      year: [[1976, 11, 18], { years: 43 }, 2019, 11, :M11, 18],
      months: [[1976, 11, 18], { months: 3 }, 1977, 2, :M02, 18],
      days: [[1976, 11, 18], { days: 20 }, 1976, 12, :M12, 8],
      month_last_day: [[2019, 1, 31], { months: 1 }, 2019, 2, :M02, 28],
      negative_year: [[2019, 11, 18], { years: -43 }, 1976, 11, :M11, 18],
      negative_month_over_year: [[1977, 2, 18], { months: -3 }, 1976, 11, :M11, 18],
      negative_day: [[1976, 12, 8], { days: -20 }, 1976, 11, :M11, 18],
      negative_month: [[2019, 2, 28], { months: -1 }, 2019, 1, :M01, 28],
    }.each do |name, data|
      define_method "test_#{name}" do
        units, arguments, year, month, month_code, day = data

        added_date = subject(*units).add(arguments)

        assert_plain_date_values(added_date, year, month, month_code, day)
      end
    end

    def test_duration
      skip "Test when Temporal::Duration is created"
      # assert_plain_date_values(subject.add(Temporal.Duration.from("P43Y")), 2019, 11, "M11", 18)
    end
  end
end
