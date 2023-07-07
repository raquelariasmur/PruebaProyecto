class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :require_user_admin_logged_in!

  include ClientsHelper

  def index
    @clients = Client.all
    if params[:search].present?
      @clients = @clients.filter_in_search(params[:search], search_tranlation_value(params[:search]))
    end
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_url(@client), notice: t("application.was_created", model: t("activerecord.modules.clients.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_url(@client), notice: t("application.was_updated", model: t("activerecord.modules.clients.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: t("application.was_destroyed", model: t("activerecord.modules.clients.one"))
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:firstname, :lastname, :email, :password, :password_confirmation, :direction, :enabled)
  end
end
