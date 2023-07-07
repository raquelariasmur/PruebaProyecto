module Api
  class OrderStatesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_order_state, only: %i[ show edit update destroy ]
    before_action :require_logged_in!

    def index
      @order_states = OrderState.all
    end

    def show; end

  end
end
