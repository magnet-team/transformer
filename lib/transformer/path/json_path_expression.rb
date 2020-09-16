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
        modified_path = path
        modified_path = "$.#{modified_path}" unless modified_path.start_with?('$.')
        JsonPath.new(modified_path)
      end
    end
  end
end
