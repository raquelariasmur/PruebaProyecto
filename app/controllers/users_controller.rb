class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user_admin_logged_in!
  include UsersHelper

  def index
    @users = User.all # creates an anonymous scope
    if params[:search].present?
      @users = @users.filter_by_username(params[:search], search_tranlation_value(params[:search]))
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user), notice: t("application.was_created", model: t("activerecord.modules.users.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t("application.was_updated", model: t("activerecord.modules.users.one"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to sign_in_path, notice: t("application.was_destroyed", model: t("activerecord.modules.users.one"))
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :usertype)
  end
end
