# frozen_string_literal: true

module Transformer
  module Mapper
    class Json < Base
      include ActiveModel::Validations
      include Memery

      def self.transform(json:, mapping:)
        new(json: json, mapping: mapping).transform
      end

      def initialize(json:, mapping:)
        @json    = json
        @mapping = mapping.deep_stringify_keys
      end

      def transform(options = {})
        mapping.each_with_object({}) do |(target, json_path), result|
          transformer =
            Transformer::Path::Factory.manufacture(
              json_path: json_path,
              target:    target
            )

          result[target] = transformer.transform json: json
        end.deep_symbolize_keys
      end

      private

      attr_reader :json, :mapping
    end
  end
end
