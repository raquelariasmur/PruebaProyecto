module Api
  class UserSessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      user = User.find_by(username: params[:username])
      if user.present? && user.usertype == "kitchener" && user.authenticate(params[:password])
        session[:user_id] = user.id
        render "api/sessions/accepted", status: :accepted
      else
        render "api/sessions/unauthorized", status: :unauthorized
      end
    end

    def destroy
      session[:user_id] = nil
      render "api/sessions/accepted", status: :accepted
    end
  end
end
