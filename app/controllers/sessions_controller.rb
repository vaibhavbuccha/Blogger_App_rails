class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies[:email] =  { value: params[:email], expires: Time.now + 3600}
        cookies[:password] = { value: params[:password], expires: Time.now + 3600}
      else
        cookies.delete(:email)
        cookies.delete(:password)
      end

      # binding.pry
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
