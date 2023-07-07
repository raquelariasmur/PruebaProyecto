module Api
  class DishesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :require_logged_in!
    before_action :set_dish, only: %i[ show edit update destroy ]
    include DishesHelper

    def index
      @dishes = Dish.all.where("state IS true")
      if params[:search].present?
        @dishes = @dishes.filter_on_search(params[:search], search_translation_value(params[:search]))
      end
    end

    def show; end

    private
    def set_dish
      @dish = Dish.find(params[:id])
    end

  end
end
