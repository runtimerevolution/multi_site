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

    def in_site?
      current_site.present?
    end

    def find_current_site
      if params[:multi_site].blank?
        MultiSite.current_site = nil
      else
        MultiSite.current_site = Site.find_by_url(params[:multi_site].to_s)
      end
    end

  end
end
