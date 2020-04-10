# frozen_string_literal: true

module Transformer
  module Path
    class Root < Base
      def transform(json:)
        path = "$.#{path}" unless json_path.match?(/\A\$\./)
        JsonPath.new(json_path).first(json)
      end
    end
  end
end
