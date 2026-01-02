# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.now.instant
# description: Temporal.Now.instant returns an Instant
# features: [Temporal]
# ---*/

require_relative "../../../../test_helper"

module Temporal::Now::TestInstant
  class Constructor < Minitest::Test
    def test_return_instance
      subject = Temporal::Now.instant

      assert_instance_of(Temporal::Instant, subject)
    end
  end
end
