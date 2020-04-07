# frozen_string_literal: true

module Transformer
  module Mapper
    class Hash
      include ActiveModel::Validations
      include Memery

      def initialize(attributes:, dictionary:, mapping:)
        @attributes = attributes.deep_symbolize_keys
        @dictionary = dictionary.deep_symbolize_keys
        @mapping    = mapping.deep_symbolize_keys
      end

      def transform
        root.each_pair do |key, value|
          if field_names.include?(key)
          end

          if types.include?(key.singularize)
          end
        end
      end

      # def transform
      #   mapping_rules.each_with_object({}) do |(source_name, target_name), new_attributes|
      #     type = dictionary_fields[target_name][:type].safe_constantize
      #     next if type.nil?
      #
      #     new_attributes[target_name] = type.transform attributes[source_name]
      #   end
      # end

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

      attr_reader :attributes, :dictionary, :dictionary_fields, :mapping, :mapping_fields
    end
  end
end
