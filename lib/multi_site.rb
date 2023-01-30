# frozen_string_literal: true

require 'active_record'
require 'action_controller'
require 'active_model'
require 'multi_site/version'
require 'multi_site/rails/routes'
require 'multi_site/active_record'
require 'multi_site/action_controller'
require 'multi_site/supra/action_controller'
require 'request_store'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.include MultiSite::ActiveRecord
  ActionController::Base.include MultiSite::ActionController
  ActionController::Base.extend MultiSite::Supra::ActionController::Macro
end
