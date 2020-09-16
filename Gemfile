# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in transformer.gemspec
gemspec

gem 'activemodel'
gem 'activesupport'
gem 'chronic'
gem 'jsonpath'
gem 'memery'
gem 'optimist'
gem 'rake', '~> 12.0'
gem 'zeitwerk'

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-markdown'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rubocop'
  gem 'rubocop-faker'
  gem 'rubocop-ordered_methods'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
  gem 'rubocop-thread_safety'
  gem 'yamllint', github: 'martinstreicher/yamllint', branch: 'master'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
  gem 'rspec', '~> 3.0'
end
