module MultiSite
  module Supra
    mattr_reader :default_site
    # accessor to declare the default site
    def self.default_site=(site)
      @@default_site = MultiSite::Supra.find_site(site)
    end

    class << self
      # Set's the current site scope
      def current_site=(site)
        Thread.current[:scoped_site_id] = site.try(:id)
      end

      # Reads the current site
      def current_site
        Site.find(Thread.current[:scoped_site_id]) if Thread.current[:scoped_site_id]
      end
    end

    # Provides controllers (tipically backoffice controllers) the ability to
    # switch between site, thus scoping the data to the selected site.
    #
    # Set's the current site scope
    #
    # class Supra::AdminController < ApplicationController
    #   def switch_site
    #     self.current_site = Site.find(params[:site_id])
    #     redirect_to :root
    #   end
    # end
    #
    # The default scoped site is declaration:
    #
    # MultiSite::Supra.default_site = Site.active.first
    #
    module ActionController
      extend ActiveSupport::Concern

      module Macro
        # The class macro to declare a supra site controller
        def cross_site_controller
          include MultiSite::Supra::ActionController
        end
      end

      included do
        prepend_before_filter :set_current_site
        helper_method :current_site
      end

      # controller accessor to set the current site
      def current_site=(site)
        MultiSite::Supra.current_site = MultiSite::Supra.find_site(site)
      end

      # the current site
      def current_site
        MultiSite::Supra.current_site
      end

      def set_current_site
        MultiSite::Supra.current_site = Supra.current_site || MultiSite::Supra.default_site
      end
    end

    private
    def self.find_site(site)
      case site
      when String, Integer
        Site.find_by_id(site)
      else
        site
      end
    end
  end
end