# frozen_string_literal: true

require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'gemika/tasks'
rescue LoadError
  puts 'Run `gem install gemika` for additional tasks'
end
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task test: :spec
task default: 'matrix:spec'
