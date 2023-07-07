class OrdersController < ApplicationController
  before_action :require_user_admin_logged_in!
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_order_states
  before_action :set_clients
  include OrdersHelper


  def index
    @orders = Order.all
    @orders = Order.includes(:client, :order_state).references(:client, :order_state).search_by_client_state_date(
      params[:search], params[:start_date], params[:end_date], params[:date_check], params[:order_state_id], params[:state_check])
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_url(@order), notice: t("application.was_created", model: t("activerecord.modules.orders.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_url(@order), notice: t("application.was_updated", model: t("activerecord.modules.orders.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: t("application.was_destroyed", model: t("activerecord.modules.orders.one"))
  end

  def set_order_states
    @order_states = OrderState.all.map { |order_state| ["#{t("activerecord.attributes.order_state.names.#{order_state.name}")} / #{order_state.time_in_minutes} #{t('application.minutes')}", order_state.id] }
  end

  def set_clients
    @clients = Client.all.map { |client| ["#{client.firstname}  #{client.lastname}", client.id] }
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
  
   def order_params
     params.require(:order).permit(:total, :subtotal, :order_state_id, :client_id)
   end

end
