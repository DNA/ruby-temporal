# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaindatetimeiso
# description: >
#   Appropriate error thrown when argument cannot be converted to a valid string
#   for time zone
# features: [BigInt, Symbol, Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainDateTimeISO
  class Timezone < Minitest::Test
    {
      nil:                nil,
      boolean:            true,
      empty_string:       "",
      invalid_iso_string: 1,
      iso_string:         19_761_118,
      bigint:             (1 << 64) + 1,
      object:             self,
      duration:           Temporal::Duration.new,
    }.each do |name, value|
      define_method("test_#{name}") do
        assert_raises(RangeError) do
          Temporal::Now.plain_date_time_iso(tz: value)
        end
      end
    end
  end
end
