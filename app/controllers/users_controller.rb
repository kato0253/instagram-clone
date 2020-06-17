class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to blogs_path
      redirect_to sessions_new_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    flash[:success] = 'ユーザー情報を編集しました。'
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      render :edit
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end

  def user_favorite
    @favorite = Favorite.where(user_id: current_user.id)
  end

  def ensure_correct_user
      # @user = User.find_by(params[:id])
      # if @user != params[:id].to_i

      # if @user != session[:user_id]
      #   flash[:notice] = "権限がありません"
      #   redirect_to("/users/1/edit")
      # end
      @user = User.find(params[:id])
      if @user.id != session[:user_id]
      flash[:notice] = “アクセスする権限がありません。正しいユーザーでログインしてください”
      # redirect_to root_url unless @user == current_user
      redirect_to("/users/id/edit")
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image, :image_cache)
  end

end
