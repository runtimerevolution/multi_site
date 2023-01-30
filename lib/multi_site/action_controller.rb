# frozen_string_literal: true

module MultiSite
  # Controller mixin for multi-site management
  module ActionController
    extend ActiveSupport::Concern

    included do
      if Rails.version.to_i > 4
        prepend_before_action :find_current_site
      else
        prepend_before_filter :find_current_site
      end
      helper_method :current_site, :in_site?
    end

    def current_site
      MultiSite.current_site
    end

    def current_site_id
      MultiSite.current_site_id
    end

    def in_site?
      current_site.present?
    end

    def find_current_site
      MultiSite.current_site = params[:multi_site].blank? ? nil : Site.where(url: params[:multi_site]).first
    end
  end
end