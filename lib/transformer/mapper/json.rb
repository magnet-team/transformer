# frozen_string_literal: true

module Transformer
  module Mapper
    class Json < Base
      include ActiveModel::Validations
      include Memery

      def self.transform(json:, mapping:, root: '$')
        new(json: json, mapping: mapping, root: root).transform
      end

      def initialize(json:, mapping:, root: '$')
        @json    = json
        @mapping = mapping.deep_stringify_keys
        @root    = root
      end

      def transform(options = {})
        data =
          mapping.each_with_object({}) do |(target, json_path), result|
            transformer =
              Transformer::Path::Factory.manufacture(
                json_path: json_path,
                root:      root,
                target:    target
              )

            result[target] = transformer.transform json: json
          end

        data.deep_symbolize_keys
      end

      private

      attr_reader :json, :mapping, :root
    end
  end
end
