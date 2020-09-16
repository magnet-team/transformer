# frozen-string-literal: true

require 'active_model'
require 'active_support'
require 'active_support/core_ext/object'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'awesome_print'
require 'jsonpath'
require 'memery'
require 'transformer/version'
require 'yaml'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module Transformer
  class Error < StandardError; end
end

#
# This is an ugly monkey-patch to avoid awesome_print chatter
# polluting the logs. See github.com/awesome-print/awesome_print/pull/373
#
module AwesomePrint
  module Formatters
    class BaseFormatter
      def indented(&block)
        inspector.increase_indentation(&block)
      end
    end
  end

  class Inspector
    def increase_indentation(&block)
      indentator.indent(&block)
    end
  end
end
