# frozen-string-literal: true

require 'transformer/version'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module Transformer
  class Error < StandardError; end
end
