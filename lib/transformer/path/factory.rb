# frozen_string_literal: true

module Transformer
  module Path
    class Factory
      ROOT_KEY_REGEX = /\A(\$\.)?[[:alpha:]_\-]+\z/.freeze

      def self.manufacture(mapping:, path: '$', target: nil)
        new(mapping: mapping, path: path, target: target).manufacture
      end

      def initialize(mapping:, path: '$', target: nil)
        @mapping = mapping
        @path    = path
        @target  = target
      end

      def manufacture # rubocop:disable Metrics/AbcSize
        #
        # If mapping is nil, find the value with the same key
        # via JsonPath expression "path.target".
        return Root.new(path: "#{path}.#{target}") if mapping.nil?

        #
        # If the mapping is a string...
        #   a. and the string starts with "$.", find the root key named by mapping, or
        #
        #   b. and the string does not start with "$." and has no special JsonPath operators,
        #      find the key named by mapping at the current path, "path.mapping", or
        #
        #   c. and the string contains JsonPath operators, find the value at the
        #      absolute JsonPath expressed in mapping, "mapping"

        if mapping.respond_to?(:match?)
          if mapping.match?(ROOT_KEY_REGEX)
            updated_path = mapping.start_with?('$.') ? mapping : "#{path}.#{mapping}"
            return Root.new(path: updated_path)
          end

          return Root.new(path: mapping)
        end

        #
        # Return a map/dictionary if the mapping is expressed as a hash
        return Map.new(mapping: mapping, path: path) if mapping.is_a?(Hash)

        #
        # Return an array of elements if the mapping is expressed as an array
        return Collection.new(mapping: mapping, path: path) if mapping.is_a?(Array)
      end

      private

      attr_reader :mapping, :path, :target
    end
  end
end
