# frozen-string-literal: true

require 'active_support'
require 'active_support/core_ext/object'
require 'active_support/core_ext/string'
require 'transformer/version'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module Transformer
  class Error < StandardError; end
end
