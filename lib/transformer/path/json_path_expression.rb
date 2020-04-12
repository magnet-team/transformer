# frozen_string_literal: true

module Transformer
  module Path
    class JsonPathExpression < Base
      def [](json)
        evaluate_path[json]
      end

      def transform(json)
        evaluate_path.on(json)
      end

      private

      def evaluate_path
        path = json_path
        path = "$.#{path}" unless path.match?(/\A\$\./)
        JsonPath.new(path)
      end
    end
  end
end
