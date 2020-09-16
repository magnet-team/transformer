# frozen_string_literal: true

module Transformer
  module Path
    class List < Base
      def transform(json)
        path = "$.#{path}" unless json_path.start_with?('$.')
        JsonPath.new(path).first(json)
      end
    end
  end
end
