# frozen_string_literal: true

module Transformer
  module Path
    class Root < Base
      def [](json)
        JsonPathExpression.new(json_path: json_path)[json]
      end

      def transform(json)
        JsonPathExpression.new(json_path: json_path).transform(json: json)
      end
    end
  end
end
