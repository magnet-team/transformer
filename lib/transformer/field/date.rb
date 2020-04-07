# frozen_string_literal: true

module Transformer
  module Field
    class Date
      def self.transform(value)
        Chronic.parse(value).to_date
      end
    end
  end
end
