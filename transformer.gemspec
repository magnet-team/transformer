# frozen_string_literal: true

require_relative 'lib/transformer/version'

Gem::Specification.new do |spec|
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`
        .split("\x0")
        .reject { |f| f.match(%r{^(test|spec|features)/}) }
    end

  spec.add_runtime_dependency 'activemodel', '>= 6.0'
  spec.add_runtime_dependency 'activesupport', '>= 6.0'
  spec.add_runtime_dependency 'chronic'
  spec.add_runtime_dependency 'jsonpath'
  spec.add_runtime_dependency 'memery'
  spec.add_runtime_dependency 'optimist'

  spec.authors                       = ['Martin Streicher']
  spec.bindir                        = 'exe'
  spec.email                         = ['martin.streicher@gmail.com']
  spec.executables                   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.homepage                      = 'https://github.com/magnet-team/transformer'
  spec.metadata['changelog_uri']     = 'https://github.com/magnet-team/transformer/blob/master/CHANGELOG.md.'
  spec.metadata['homepage_uri']      = spec.homepage
  spec.metadata['source_code_uri']   = 'https://github.com/magnet-team/transformer'
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  spec.name                          = 'transformer'
  spec.require_paths                 = ['lib']
  spec.required_ruby_version         = Gem::Requirement.new('>= 2.3.0')
  spec.summary                       = 'Transform a hash from one form to another.'
  spec.version                       = Transformer::VERSION
end
