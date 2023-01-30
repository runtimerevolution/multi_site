class ApplicationController < ActionController::Base
  before_action :set_user

  attr_accessor :current_user

  private

  def set_user
    @current_user = User.first
  end
end

