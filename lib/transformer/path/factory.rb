# frozen_string_literal: true

module Transformer
  module Path
    class Factory
      def self.manufacture(json_path:, target: nil)
        new(json_path: json_path, target: target).manufacture
      end

      def initialize(json_path:, target: nil)
        @json_path = json_path
        @target    = target
      end

      def manufacture
        return Root.new(json_path: target) if json_path.nil?
        return Root.new(json_path: json_path) if json_path.match?(/\A(\$\.)?[[:alpha:]_\-]+\z/)
      end

      private

      attr_reader :json_path, :target
    end
  end
end
