class DishesController < ApplicationController
  before_action :set_dish, only: %i[ show edit update destroy ]
  before_action :require_user_admin_logged_in!
  include DishesHelper

  def index
    @dishes = Dish.all
    if params[:search].present?
      @dishes = @dishes.filter_on_search(params[:search], search_translation_value(params[:search]))
    end
  end

  def show; end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(dish_params)
      if @dish.save
        redirect_to dish_url(@dish), notice: t('application.was_created', model: t('activerecord.modules.dishes.one')) 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def update
    if @dish.update(dish_params)
      redirect_to dish_url(@dish), notice: t("application.was_updated", model: t("activerecord.modules.dishes.one"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_url, notice: t("application.was_destroyed", model: t("activerecord.modules.dishes.one"))
  end

  private
  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :state, :photography)
  end
end
