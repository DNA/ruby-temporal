# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.plaintimeiso
# description: Functions when time zone argument is omitted
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestPlainTimeISO
  class Constructor < Minitest::Test
    def test_return
      subject = Temporal::Now.plain_time_iso

      assert_instance_of(Temporal::PlainTime, subject)
    end
  end
end
