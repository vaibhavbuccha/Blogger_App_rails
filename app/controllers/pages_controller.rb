class PagesController < ApplicationController
  
  layout 'application'

  def index
  	@blogs = Blog.sorted 
  end

  def show
  	if !logged_in?
  		flash[:danger] = "Please login first"
  		redirect_to login_path
  	end
  end

end
