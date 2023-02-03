# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'multi_site/version'

Gem::Specification.new do |s|
  s.name        = 'multi_site'
  s.version     = MultiSite::VERSION
  s.description = 'Add multi-site integration into Rails applications using a shared db strategy'
  s.summary     = 'Add multi-site integration into Rails applications using a shared db strategy'
  s.authors     = ['Runtime Revolution']
  s.files       = Dir['{lib}/**/*']
  s.require_paths = %w[lib]
  s.test_files = Dir.glob('spec/**/*')
  s.required_ruby_version = '>= 2.0' # rubocop:disable Gemspec/RequiredRubyVersion

  # dependencies
  s.add_dependency('rails', '>= 4.0')
  s.add_dependency('request_store', '>= 1.0')

  s.add_development_dependency('appraisal')
  s.add_development_dependency('database_cleaner')
  s.add_development_dependency('factory_bot_rails')
  s.add_development_dependency('faker')
  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('sqlite3')
end
