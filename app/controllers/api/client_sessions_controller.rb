module Api
  class ClientSessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      @client = Client.find_by(email: params[:email])

      if @client.present? && @client.enabled && @client.authenticate(params[:password])
        session[:user_id] = @client.id
        render "api/sessions/log_in_accepted", status: :accepted
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
