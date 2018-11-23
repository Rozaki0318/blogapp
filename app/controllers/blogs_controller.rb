class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to '/', notice: 'your blog has been successfully created.'}
      else
        format.html { redirect_to '/blogs/new', notice: 'Sorry, your blog has not been saved.'}
      end
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
