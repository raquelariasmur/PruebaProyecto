class OrderStatesController < ApplicationController
  before_action :set_order_state, only: %i[ show edit update destroy ]
  before_action :require_user_admin_logged_in!

  def index
    @order_states = OrderState.all
  end

  def show; end

  def new
    @order_state = OrderState.new
  end

  def edit; end

  def update
    if @order_state.update(order_state_params)
      redirect_to order_state_url(@order_state), notice: t("application.was_updated", model: t("activerecord.modules.order_states.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_order_state
    @order_state = OrderState.find(params[:id])
  end

  def order_state_params
    params.require(:order_state).permit(:name, :time_in_minutes)
  end
end
