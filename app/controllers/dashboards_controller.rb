class DashboardsController < ApplicationController
  before_action :require_user_admin_logged_in!

  def index; end
end
