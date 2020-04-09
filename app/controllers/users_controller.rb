class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	checkemail = User.find_by(email: @user[:email])
  	if checkemail == nil
  		# abort checkemail.inspect
	  	if @user.save
        UserMailer.new_user(@user).deliver_now

	  		flash[:success] = "Account has been created successfully!.."
	  		redirect_to login_path
	  	else
	  		flash[:danger] = "Somthing wents wrong try again.."
	  		redirect_to('show')
	  	end
	else
		# abort checkemail.inspect
		flash[:danger] = "Email already exists. try to login or use another email address."
	  	redirect_to(show)
	end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:image)
  end
end
