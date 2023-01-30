module Admin
  class AdminController < ApplicationController
    cross_site_controller

    def show
      @admin_site = current_site
      render json: @admin_site
    end

    def switch_site
      self.current_site = Site.find(params[:site_id])
      redirect_to admin_admin_url, notice: "Switched to: #{current_site.url}"
    end
  end
end
