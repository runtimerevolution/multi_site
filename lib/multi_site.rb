require "active_record"
require "action_controller"
require "active_model"
require "multi_site/version"
require 'multi_site/rails/routes'
require "multi_site/active_record.rb"
require "multi_site/action_controller.rb"
require "multi_site/supra/action_controller.rb"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:include, MultiSite::ActiveRecord)
  ActionController::Base.send(:include, MultiSite::ActionController)
  ActionController::Base.extend(MultiSite::Supra::ActionController::Macro)
end
