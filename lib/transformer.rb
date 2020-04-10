# frozen-string-literal: true

require 'active_model'
require 'active_support'
require 'active_support/core_ext/object'
require 'active_support/core_ext/string'
require 'awesome_print'
require 'memery'
require 'transformer/version'
require 'yaml'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module Transformer
  class Error < StandardError; end
end
