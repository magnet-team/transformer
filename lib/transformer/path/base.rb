# frozen_string_literal: true

module Transformer
  module Path
    class Base
      def initialize(path:, mapping: {})
        @path    = path
        @mapping = mapping
      end

      def transform(_json)
        raise 'Transform method not implemented'
      end

      private

      attr_reader :mapping, :path
    end
  end
end
