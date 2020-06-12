class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:image, :image_cache)
  end

end
