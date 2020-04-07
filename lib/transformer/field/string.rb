# frozen_string_literal: true

module Transformer
  module Field
    class String < Base
      BLANK = ' '

      def self.transform(value)
        value.to_s.squeeze BLANK
      end
    end
  end
end
