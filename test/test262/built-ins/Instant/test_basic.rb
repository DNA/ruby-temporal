# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.instant
# description: Basic functionality of the Temporal.Instant constructor
# features: [Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestInstant
  class Constructor < Minitest::Test
    def test_bigint
      subject = Temporal::Instant.new(217_175_010_123_456_789)

      assert_equal(217_175_010_123, subject.epoch_milliseconds, "BigInt epoch_milliseconds")
    end

    def test_number_string
      subject = Temporal::Instant.new("217175010123456789")

      assert_equal(217_175_010_123, subject.epoch_milliseconds, "String epoch_milliseconds")
    end

    def test_invalid_string
      assert_raises(TypeError, "invalid BigInt syntax") do
        Temporal::Instant.new("abc123")
      end
    end
  end
end
