# frozen_string_literal: true

module Transformer
  module Path
    class Factory
      def self.manufacture(mapping:, path: '$', target: nil)
        new(mapping: mapping, path: path, target: target).manufacture
      end

      def initialize(mapping:, path: '$', target: nil)
        @mapping = mapping
        @path    = path
        @target  = target
      end

      def manufacture
        return Root.new(path: "#{path}.#{target}") if mapping.nil?

        if mapping.respond_to?(:match?) && mapping.match?(/\A(\$\.)?[[:alpha:]_\-]+\z/)
          updated_path = mapping.match?(/\A\$\./) ? mapping : "#{path}.#{mapping}"
          return Root.new(path: updated_path)
        end

        return Map.new(mapping: mapping, path: path) if mapping.is_a?(Hash)
#         # return List.new(json_path: json_path) if json_path.is_a?(Array)
      end

      private

      attr_reader :mapping, :path, :target
    end
  end
end
