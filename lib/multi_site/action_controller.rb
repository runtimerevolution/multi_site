module MultiSite
  #Controller mixin for multi-site management
  module ActionController
    extend ActiveSupport::Concern

    included do
      prepend_before_filter :find_current_site
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
      if params[:multi_site].blank?
        MultiSite.current_site = nil
      else
        MultiSite.current_site = Site.where(url: params[:multi_site]).first
      end
    end
  end
end
