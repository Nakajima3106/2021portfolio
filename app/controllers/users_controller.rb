class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts.page(params[:page]).reverse_order
  end

  def index
    @user = User.where.not(id: current_user.id)
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduction)
  end


end
