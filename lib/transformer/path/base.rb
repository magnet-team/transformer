# frozen_string_literal: true

module Transformer
  module Path
    class Base
      def initialize(json_path:)
        @json_path = json_path.to_s
      end

      def transform(json:)
        raise 'Not implemented'
      end

      private

      attr_reader :json, :json_path
    end
  end
end
