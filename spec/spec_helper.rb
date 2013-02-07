# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'faker'
# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)
Rails.backtrace_cleaner.remove_silencers!

require 'factory_girl'

Site.delete_all

FactoryGirl.find_definitions

RSpec.configure do |config|

  require 'rspec/expectations'
  config.include RSpec::Matchers

  config.expect_with :rspec do |c|
    c.syntax = [:should]
  end
end