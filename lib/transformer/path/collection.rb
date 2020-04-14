# frozen_string_literal: true

module Transformer
  module Path
    class Collection < Base
      def transform(json)
        modified_mapping = mapping.first.deep_dup
        source           = modified_mapping.delete('source')
        updated_path     = "#{path}.#{source}[*]"
        elements         = JsonPath.new(updated_path).on(json)

        elements.each_with_index.map do |element, index|
          updated_path = "#{path}.#{source}[#{index}]"

          modified_mapping.each_with_object({}) do |(key, value), result|
            transformer = Factory.manufacture(mapping: value || key, path: updated_path)
            result[key] = transformer.transform(json)
          end
        end
      end
    end
  end
end
