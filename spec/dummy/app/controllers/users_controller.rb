class UsersController < ApplicationController

  def index
    @users = User.on_site
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.valid? and @user.save
      redirect_to users_path(current_site.url)
    else
      render :action => :new
    end
  end

end
