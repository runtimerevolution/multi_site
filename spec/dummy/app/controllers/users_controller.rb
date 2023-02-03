# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: { ola: 'mundo' }
  end

  def show
    render json: { site: current_site }
  end
end
