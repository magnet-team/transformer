# frozen_string_literal: true

module Transformer
  module Mapper
    class Base
      include ActiveModel::Validations
      include Memery

      def initialize(attributes:, dictionary:, mapping:)
        @attributes = attributes.deep_symbolize_keys
        @dictionary = dictionary.deep_symbolize_keys
        @mapping    = mapping.deep_symbolize_keys
      end

      private

      memoize def field_names
        mapping_fields.keys
      end

      memoize def mapping_fields
        mapping[:fields]
      end

      memoize def mapping_types
        mapping[:types]
      end

      def root
        keys = mapping[:data].split(':').map(&:to_sym)
        attributes.dig(*keys)
      end

      memoize def types
        mapping_types.keys
      end

      attr_reader :attributes, :dictionary, :mapping
    end
  end
end
