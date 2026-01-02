# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaintimeiso
# description: >
#   Time zone parsing from ISO strings does not accept sub-minute UTC offset as
#   time zone identifier
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainTimeISO
  class Timezone < Minitest::Test
    {
      subsec_offset:              "-12:12:59.9",
      complete_subsec_iso_string: "2021-08-19T17:30:45.123456789-12:12:59.9[-12:12:59.9]",
    }.each do |name, value|
      define_method("test_#{name}") do
        assert_raises(RangeError, "#{value} is not a valid time zone string") do
          Temporal::Now.plain_time_iso(tz: value)
        end
      end
    end
  end
end
