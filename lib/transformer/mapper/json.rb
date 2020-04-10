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
        mapping.each_with_object({}) do |(target, path), result|
          if path.nil?
            path = target
          end

          if path.match?(/\A[[:alpha:]]/)
            path = "$.#{path}"
            result[target] = JsonPath.new(path).first(json)
            next
          end
        end.deep_symbolize_keys
      end

      private

      attr_reader :json, :mapping
    end
  end
end
