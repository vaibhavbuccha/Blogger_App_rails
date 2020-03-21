class BlogsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = "Blog added successfully..."
      redirect_to root_path
    else
      flash[:danger] = "Somthing wents wrong!"
      redirect_to(new)
    end
  end

  def edit
  end

  def delete
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:content,:image,:user_id)
  end
end
