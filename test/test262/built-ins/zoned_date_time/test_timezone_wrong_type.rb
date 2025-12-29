# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.zoneddatetime
# description: >
#   Appropriate error thrown when argument cannot be converted to a valid string
#   for time zone
# features: [BigInt, Symbol, Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestZonedDateTime
  class Timezone < Minitest::Test
    {
      nil: nil,
      boolean: true,
      empty_string: "",
      invalid_iso_string: 1,
      valid_iso_string_in_other_contexts: 19_761_118,
      bigint: (1 << 64) + 1,
    }.each do |name, value|
      define_method("test_#{name}") do
        assert_raises(RangeError) do
          Temporal::ZonedDateTime.new(0, tz: value)
        end
      end
    end
  end
end
