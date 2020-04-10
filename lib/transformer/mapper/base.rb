# frozen_string_literal: true

require 'jsonpath'

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

      attr_reader :attributes, :dictionary, :mapping
    end
  end
end
