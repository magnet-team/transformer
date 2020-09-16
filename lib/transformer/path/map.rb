# frozen_string_literal: true

module Transformer
  module Path
    class Map < Base
      def transform(json)
        modified_mapping = mapping.deep_dup
        source           = modified_mapping.delete('source')
        updated_path     = "#{path}.#{source}"

        modified_mapping.each_with_object({}) do |(key, value), result|
          transformer = Factory.manufacture(mapping: value, path: updated_path)
          result[key] = transformer.transform(json)
        end
      end
    end
  end
end
