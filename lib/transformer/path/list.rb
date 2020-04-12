# frozen_string_literal: true

module Transformer
  module Path
    class List < Base
      def initialize(json_path:)
        @json_path = json_path
      end

      def transform(json)
        byebug

        path = "$.#{path}" unless json_path.match?(/\A\$\./)
        JsonPath.new(json_path).first(json)
      end
    end
  end
end
