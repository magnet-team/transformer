# frozen_string_literal: true

module Transformer
  module Path
    class Factory
      def self.manufacture(json_path:, root: nil, target: nil)
        new(json_path: json_path, root: root, target: target).manufacture
      end

      def initialize(json_path:, root: nil, target: nil)
        @json_path = json_path
        @root      = root
        @target    = target
      end

      def manufacture
        byebug
        return Root.new(json_path: target) if json_path.nil?

        return Hash.new(json_path: json_path) if json_path.is_a?(Hash)
        return List.new(json_path: json_path) if json_path.is_a?(Array)
        return Root.new(json_path: json_path) if json_path.match?(/\A(\$\.)?[[:alpha:]_\-]+\z/)
      end

      private

      attr_reader :json_path, :target
    end
  end
end
