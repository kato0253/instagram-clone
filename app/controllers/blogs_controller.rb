class BlogsController < ApplicationController

  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :authenticate_user

  def new
    # @blog = current_user.blogs.build
    @blog = Blog.new
  end

  def create

    @blog = current_user.blogs.build(blog_params)
    @user = @blog.user.name
    if @blog.save
      ContactMailer.contact_mail(@blog).deliver
      redirect_to new_blog_path, notice:"投稿を作成しました！"
      else
      render :"new"
    end

  end

  def index
    @blogs = Blog.all
    @blog = Blog.find_by(params[blog: :id])
      # redirect_to(root_path) unless current_user?(@blog)
  end

  def confirm
    # binding.irb
    # if logged_in?
    # @blog = Blog.new(blog_params)
    @blog = current_user.blogs.build(blog_params)
    # binding.irb
    render :new if @blog.invalid?
    # else
    # end
  end

  def destroy

    @blog.destroy
    redirect_to blogs_path,notice:"投稿を削除しました！"

  end

  def edit　
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path,notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def show
    # @blog = Blog.find(params[:id])
    @blog = Blog.find_by(params[blog: :id])
    # @blog = Blog.find_by(id: params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end



  private
  def blog_params
    params.require(:blog).permit(:title, :content,:image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
