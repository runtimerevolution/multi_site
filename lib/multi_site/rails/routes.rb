# frozen_string_literal: true

module ActionDispatch
  module Routing
    # Class Mapper
    class Mapper
      def multi_site_scope(&block)
        scope ':multi_site', as: 'site', constraints: MultiSite::MultiSiteConstraints.new do
          block.call
        end
      end
    end
  end
end

module MultiSite
  # Class MultiSiteConstraints
  class MultiSiteConstraints
    def matches?(request)
      # TODO: This is not a definitive solution. Devise principal class is configurable,
      # so we can't be sure if the the routes will start with users/...
      # Devise settings must be read to know the principal's name
      return true if defined?(Devise) && ['devise/sessions',
                                          'users/registrations',
                                          'users/passwords'].include?(request.path_parameters[:controller])

      Site.exists?(url: request.path_parameters[:multi_site])
    end
  end
end