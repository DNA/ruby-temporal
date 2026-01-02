# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaintimeiso
# description: Negative zero, as an extended year, is rejected
# features: [Temporal, arrow-function]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainTimeISO
  class Timezone < Minitest::Test
    {
      negative_zero:               "-000000-10-31T17:45Z",
      negative_zero_with_timezone: "-000000-10-31T17:45+00:00[UTC]",
    }.each do |name, value|
      define_method("test_#{name}") do
        assert_raises(RangeError, "reject minus zero as extended year") do
          Temporal::Now.plain_time_iso(tz: value)
        end
      end
    end
  end
end
