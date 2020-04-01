class BlogsController < ApplicationController
  
  def index
  end

  def show
    if logged_in?
      user = current_user
      @blog = Blog.where(user_id: user.id).order("created_at DESC")
      # abort @blog.inspect
    else
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      @blog = Blog.new
    else
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @blog = Blog.new(blog_params)
      if @blog.save
        flash[:success] = "Blog added successfully..."
        redirect_to root_path
      else
        flash[:danger] = "Somthing wents wrong!"
        redirect_to(new)
      end
    else
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end

  def edit
  end

  def delete
  end

  def destroy
    if logged_in?
      @blog = Blog.find(params[:blog][:id])
      @blog.destroy 
      flash[:success] = "Blog '#{@blog.title}' deleted successfully.... "
      redirect_to(root_path)
    else
      flash[:danger] = "Please login first"
      redirect_to login_path
    end
  end


  private
  def blog_params
    params.require(:blog).permit(:title,:content,:image,:user_id)
  end
end
