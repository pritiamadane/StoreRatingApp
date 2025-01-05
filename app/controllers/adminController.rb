class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def dashboard
    @total_users = User.count
    @total_stores = Store.count
    @total_ratings = Rating.count
  end

  def users
    @users = User.all
    @users = @users.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    @users = @users.order(params[:sort] || 'name')
  end

  def stores
    @stores = Store.all
    @stores = @stores.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    @stores = @stores.order(params[:sort] || 'name')
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User  created successfully'
    else
      render :new_user
    end
  end

  private

  def authorize_admin
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :role)
  end
end