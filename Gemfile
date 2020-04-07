# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in transformer.gemspec
gemspec

gem 'activemodel'
gem 'activesupport'
gem 'chronic'
gem 'memery'
gem 'rake', '~> 12.0'
gem 'zeitwerk'

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-markdown'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

group :development, :test do
  gem 'rspec', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-faker'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
  gem 'rubocop-ordered_methods'
  gem 'rubocop-thread_safety'
end
