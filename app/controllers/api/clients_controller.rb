module Api
  class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_client
    before_action :require_logged_in!

    def update_password
      if !params[:current_password].nil? && !params[:new_password].nil? && !params[:new_password].empty? && @client.authenticate(params[:current_password]) 
        if @client.update_attribute(:password, params[:new_password])
          render 'api/sessions/accepted', status: :accepted
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      else
        render 'api/sessions/unauthorized', status: :unauthorized
      end
    end

    def update
      if !params[:current_password].nil? && @client.authenticate(params[:current_password]) 
        if @client.update(client_params)
          render 'api/clients/show', status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      else
        render 'api/sessions/unauthorized', status: :unauthorized
      end
    end


    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:firstname, :lastname, :direction).merge(password: params[:current_password])
    end
  end
end
