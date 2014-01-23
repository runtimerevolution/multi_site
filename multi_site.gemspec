# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "multi_site/version"

Gem::Specification.new do |s|
  s.name        = "multi_site"
  s.version     = MultiSite::VERSION
  s.description = %q{Add multi-site integration into Rails applications using a shared db strategy}
  s.summary     = %q{Add multi-site integration into Rails applications using a shared db strategy}
  s.authors     = ["Runtime Revolution"]
  s.files       = Dir["{lib}/**/*"]
  s.require_paths = %w(lib)
  s.test_files = Dir.glob("spec/**/*")
  # dependencies
  s.add_dependency('rails', '>= 4.0')

  s.add_development_dependency('rspec-rails')
  s.add_development_dependency('factory_girl')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('faker')
  s.add_development_dependency('database_cleaner')
end
