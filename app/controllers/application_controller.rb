class ApplicationController < ActionController::Base
  def require_user_logged_in!
    render "api/sessions/unauthorized", status: :unauthorized if session[:user_id].nil?
  end

  def require_user_admin_logged_in!
    current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    redirect_to sign_in_path, alert: t("application.no_signed_in") if session[:user_id].nil?
    redirect_to sign_in_path, alert: t("application.must_be_admin") if !session[:user_id].nil? && !current_user.nil? && current_user.usertype != "administrator"
  end

  def require_logged_in! 
    user_is_logued = !session[:user_id].nil?
    render "api/sessions/unauthorized", status: :unauthorized if !user_is_logued
  end
end
