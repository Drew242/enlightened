class DashboardController < ApplicationController
  require 'wikipedia'
  before_action :authorize!

  def show
  end

  def search
    @page = Wikipedia.find(params[:q])
  end
end
