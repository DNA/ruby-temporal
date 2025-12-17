# frozen_string_literal: true

module Temporal::Units
  class Year < Base
    def +(other, inplace: true)
      result = @value + other

      @value = result if inplace

      self.class.new(result)
    end

    def -(other, inplace: true)
      result = @value - other

      @value = result if inplace

      self.class.new(result)
    end

    private

    def value=(value)
      value = case value
              in true then 1
              in false then 0
              else value
              end

      super
    end
  end
end
