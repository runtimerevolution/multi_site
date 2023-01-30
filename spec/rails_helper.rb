# frozen_string_literal: true

require 'rails'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'faker'
require 'factory_bot'
require_relative "dummy.#{Rails.version.to_f}/config/environment"
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
