# frozen_string_literal: true

# Original comment
#
# /*---
# esid: sec-temporal.instant
# description: TypeError thrown if input is of wrong primitive type
# features: [Symbol, Temporal]
# ---*/

require_relative "../../../test_helper"

module Temporal::TestInstant
  class Constructor < Minitest::Test
    def test_raise_on_undefined
      assert_raises(ArgumentError) { Temporal::Instant.new }
    end

    def test_raise_on_nil
      assert_raises(TypeError) { Temporal::Instant.new(nil) }
    end

    def test_raise_on_symbol
      assert_raises(TypeError) { Temporal::Instant.new(:now) }
    end
  end
end
