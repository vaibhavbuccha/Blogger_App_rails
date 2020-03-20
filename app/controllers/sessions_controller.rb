class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:user_name] = user.name
  		flash[:success] ="Welcome"
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Your credentials didn't match"
  		render('new')
  	end
  end

  def destroy
  	session[:user_id] = nil
  	session[:user_name] = nil
  	flash[:success] = "Good bye"
  	redirect_to root_path
  end

end