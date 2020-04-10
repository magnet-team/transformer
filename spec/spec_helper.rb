# frozen_string_literal: true

require 'byebug'
require 'bundler/setup'
require 'transformer'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def file_fixture(filename)
  root = File.join File.expand_path(__dir__), 'fixtures'
  File.read File.join(root, "#{filename}.yml")
end

def fixture(filename)
  {
    data:    fixture_data_to_json(filename),
    mapping: fixture_mapping_to_hash(filename)
  }
end

def fixture_data_to_json(filename)
  content = YAML.safe_load(file_fixture(filename)).symbolize_keys
  content[:data].to_json
end

def fixture_mapping_to_hash(filename)
  content = YAML.safe_load(file_fixture(filename)).deep_symbolize_keys
  content[:mapping]
end
