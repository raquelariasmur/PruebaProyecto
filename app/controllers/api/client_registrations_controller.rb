module Api
  class ClientRegistrationsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      @client = Client.new(client_params)
      @client.enabled = true
      if @client.save
        render "api/client_registrations/index", status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def client_params
      params.permit(:firstname, :lastname, :email, :direction, :password, :password_confirmation)
    end
  end
end
