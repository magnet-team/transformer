# frozen_string_literal: true

module Transformer
  module Path
    class Hash < Base
      def initialize(json_path:)
        @json_path = json_path
      end

      def transform(json)
        JsonPathExpression.new(json_path).transform(json).first
        JsonPath.new(json_path).first(json)
      end
    end
  end
end
