class BlogsController < ApplicationController

  before_action :set_blog, only: [:edit, :update, :destroy]

  def new
    # @blog = current_user.blogs.build
    @blog = Blog.new
  end

  def create

    @blog = current_user.blogs.build(blog_params)
    @user = @blog.user.name
    if @blog.save
      redirect_to new_blog_path, notice:"投稿を作成しました！"
      else
      render :"new"
    end

  end

  def index

    @blogs = Blog.all


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

  def show
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



  private
  def blog_params
    params.require(:blog).permit(:title, :content,:image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
