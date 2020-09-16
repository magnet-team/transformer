# frozen_string_literal: true

module Transformer
  module Mapper
    class Json
      JSON_PATH_ROOT = '$'

      include ActiveModel::Validations
      include Memery

      def self.transform(json:, mapping:, path: JSON_PATH_ROOT)
        new(json: json, mapping: mapping, path: path).transform
      end

      def initialize(json:, mapping:, path: JSON_PATH_ROOT)
        @json    = json
        @mapping = mapping.deep_stringify_keys
        @path    = path
      end

      def transform(_options = {})
        data =
          mapping.each_with_object({}) do |(target, object), result|
            transformer =
              Transformer::Path::Factory.manufacture(
                mapping: object,
                path:    path,
                target:  target
              )

            result[target] = transformer.transform json
          end

        data.deep_symbolize_keys.tap { |x| ap x }
      end

      private

      attr_reader :json, :mapping, :path
    end
  end
end
