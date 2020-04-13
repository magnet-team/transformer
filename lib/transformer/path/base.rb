# frozen_string_literal: true

module Transformer
  module Path
    class Base
      def initialize(mapping: {}, path:)
        @path    = path
        @mapping = mapping
      end

      def transform(json)
        raise 'Transform method not implemented'
      end

      private

      attr_reader :mapping, :path
    end
  end
end
