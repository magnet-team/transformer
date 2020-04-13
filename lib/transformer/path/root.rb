# frozen_string_literal: true

module Transformer
  module Path
    class Root < Base
      def [](json)
        JsonPathExpression.new(path: path)[json]
      end

      def transform(json)
        self[json].first
      end
    end
  end
end
